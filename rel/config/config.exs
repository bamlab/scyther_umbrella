use Mix.Config
config :scyther, Scyther.Repo,
  url: System.get_env("DATABASE_URL")
