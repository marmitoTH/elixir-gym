defmodule Elixirgym.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Elixirgym.Training

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields [:name, :email, :password]

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    has_many :trainings, Training

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> hash_password()
  end

  defp hash_password(changeset) do
    %{password_hash: hash} = Argon2.add_hash(changeset.changes.password)
    put_change(changeset, :password, hash)
  end
end
