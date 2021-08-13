defmodule Elixirgym.Repo do
  use Ecto.Repo,
    otp_app: :elixirgym,
    adapter: Ecto.Adapters.Postgres
end
