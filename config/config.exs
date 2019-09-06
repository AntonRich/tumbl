# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tumbl,
  ecto_repos: [Tumbl.Repo]

# Configures the endpoint
config :tumbl, TumblWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NCQDDjOcoFxFUH+r/jtxfaL0wmhuAt38+uOfC8vE6jUdjqOi/S7HykPY5cExpLcc",
  render_errors: [view: TumblWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tumbl.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
