defmodule Elixirgym.Training.Create do
  alias Elixirgym.{Repo, Training}

  def call(params) do
    params
    |> Training.changeset()
    |> Repo.insert()
  end
end
