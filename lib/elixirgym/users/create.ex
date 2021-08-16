defmodule Elixirgym.User.Create do
  alias Elixirgym.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
