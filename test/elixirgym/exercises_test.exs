defmodule Elixirgym.ExerciseTest do
  use Elixirgym.DataCase, async: true

  alias Elixirgym.Exercise

  describe "changeset/2" do
    test "returns valid changeset when all parameters are valid" do
      params = %{name: "Exercise", description: "Description", repetitions: "3x15", video_url: "video.com"}
      response = Exercise.changeset(%Exercise{}, params)
      assert %Ecto.Changeset{valid?: true} = response
    end

    test "returns invalid changeset when one parameter is invalid" do
      params = %{name: "", description: "", repetitions: "", video_url: ""}
      response = Exercise.changeset(%Exercise{}, params)
      assert %Ecto.Changeset{valid?: false} = response
    end
  end
end
