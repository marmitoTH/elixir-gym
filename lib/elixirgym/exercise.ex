defmodule Elixirgym.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  alias Elixirgym.Training

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:name, :description, :repetitions, :video_url]

  schema "exercises" do
    field :name, :string
    field :description, :string
    field :repetitions, :string
    field :video_url, :string

    belongs_to :training, Training

    timestamps()
  end

  def changeset(exercise, params) do
    exercise
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
