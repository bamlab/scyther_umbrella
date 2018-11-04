# Since configuration is shared in umbrella projects, this file
# should only configure the :scyther_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :phoenix, :json_library, Jason

# General application configuration
config :scyther_web,
  ecto_repos: [Scyther.Repo],
  generators: [context_app: :scyther]

# Configures the endpoint
config :scyther_web, ScytherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "icaFjtCqpbSzXrptViP6ROGdGHQzug6QqsGZvdwloG5NX+aOKtpH85saR24y6xNA",
  render_errors: [view: ScytherWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ScytherWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
