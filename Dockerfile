# docker build -t scyther:builder --target=builder .
FROM elixir:1.7.3-alpine as builder
RUN apk add --no-cache \
    gcc \
    git \
    make \
    musl-dev
RUN mix local.rebar --force && \
    mix local.hex --force
WORKDIR /app
ENV MIX_ENV=prod

# docker build -t scyther:deps --target=deps .
FROM builder as deps
COPY mix.* /app/
# Explicit list of umbrella apps
RUN mkdir -p \
    /app/apps/scyther \
    /app/apps/scyther_web
COPY apps/scyther/mix.* /app/apps/scyther/
COPY apps/scyther_web/mix.* /app/apps/scyther_web/
RUN mix do deps.get --only prod, deps.compile

# docker build -t scyther:frontend --target=frontend .
FROM node:10.12-alpine as frontend
WORKDIR /app
COPY apps/scyther_web/assets/package*.json /app/
COPY --from=deps /app/deps/phoenix /deps/phoenix
COPY --from=deps /app/deps/phoenix_html /deps/phoenix_html
RUN npm ci
COPY apps/scyther_web/assets /app
RUN npm run deploy

# docker build -t scyther:releaser --target=releaser .
FROM deps as releaser
COPY . /app/
COPY --from=frontend /priv/static apps/scyther_web/priv/static
RUN mix do phx.digest, release --env=prod --no-tar

# docker run -it --rm elixir:1.7.3-alpine sh -c 'head -n1 /etc/issue'
FROM alpine:3.8 as runner
RUN addgroup -g 1000 scyther && \
    adduser -D -h /app \
      -G scyther \
      -u 1000 \
      scyther
RUN apk add -U bash libssl1.0
USER scyther
WORKDIR /app
COPY --from=releaser /app/_build/prod/rel/scyther_umbrella /app
EXPOSE 4000
ENTRYPOINT ["/app/bin/scyther_umbrella"]
CMD ["foreground"]