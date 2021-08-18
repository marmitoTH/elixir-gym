defmodule Elixirgym.UserTest do
  use Elixirgym.DataCase, async: true

  alias Elixirgym.User

  describe "changeset/1" do
    test "returns valid changeset when all parameters are valid" do
      params = %{name: "John Doe", email: "john@mail.com", password: "123456"}
      response = User.changeset(params)
      assert %Ecto.Changeset{valid?: true, changes: params, errors: []} = response
    end

    test "returns invalid changeset when one parameter is invalid" do
      params = %{name: "", email: "john.com", password: "123"}
      response = User.changeset(params)
      assert %Ecto.Changeset{valid?: false} = response
    end
  end
end
