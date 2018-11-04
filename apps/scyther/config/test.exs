# Since configuration is shared in umbrella projects, this file
# should only configure the :scyther application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Configure your database
config :scyther, Scyther.Repo,
  username: "postgres",
  password: "postgres",
  database: "scyther_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
