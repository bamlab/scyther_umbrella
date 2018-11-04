# Since configuration is shared in umbrella projects, this file
# should only configure the :scyther application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Configure your database
config :scyther, Scyther.Repo,
  username: "scyther",
  password: "scyther",
  database: "scyther_dev",
  hostname: "localhost",
  pool_size: 10
