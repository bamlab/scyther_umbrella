# Since configuration is shared in umbrella projects, this file
# should only configure the :scyther application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :scyther,
  ecto_repos: [Scyther.Repo]

import_config "#{Mix.env()}.exs"
