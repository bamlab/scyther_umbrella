defmodule Scyther.Repo do
  use Ecto.Repo,
    otp_app: :scyther,
    adapter: Ecto.Adapters.Postgres
end
