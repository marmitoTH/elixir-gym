# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixirgym,
  ecto_repos: [Elixirgym.Repo]

config :elixirgym, Elixirgym.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :elixirgym, ElixirgymWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CmaMFJ5kRaB1piPtFJiTJUbvOnx2K770DkWTbOOtiJt4Jyjp0JetRmnJ7vUeeKNu",
  render_errors: [view: ElixirgymWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Elixirgym.PubSub,
  live_view: [signing_salt: "JSPxwE1L"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
