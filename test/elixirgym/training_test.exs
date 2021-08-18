defmodule Elixirgym.TrainingTest do
  use Elixirgym.DataCase, async: true

  alias Elixirgym.Training

  describe "changeset/1" do
    test "returns valid changeset when all parameters are valid" do
      params = %{start_date: "2021-08-18", end_date: "2021-09-18", user_id: "b6b4134a-bf66-46b2-ae46-5d8aabcd80e7"}
      response = Training.changeset(params)
      assert %Ecto.Changeset{valid?: true, changes: params, errors: []} = response
    end

    test "returns invalid changeset when one parameter is invalid" do
      params = %{start_date: "", end_date: "", user_id: ""}
      response = Training.changeset(params)
      assert %Ecto.Changeset{valid?: false} = response
    end
  end
end
