defmodule ElixirgymWeb.SchemaTest do
  use ElixirgymWeb.ConnCase, async: true

  alias Elixirgym.User

  describe "getUser/1" do
    test "returns user if uuid is valid", %{conn: conn} do
      user = %{name: "John Doe", email: "john@mail.com", password: "123456"}
      {:ok, %User{id: user_id}} = User.Create.call(user)

      query = """
      {
        getUser(id: "#{user_id}") {
          id,
          name,
          email
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "john@mail.com",
            "id" => user_id,
            "name" => "John Doe"
          }
        }
      }

      assert expected_response = response
    end
  end

  describe "createUser/1" do
    test "creates an user", %{conn: conn} do
      mutation = """
      mutation {
        createUser(input: {
          name: "John Doe",
          email: "john@mail.com",
          password: "123456"
        }) {
          id,
          name,
          email
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "createUser" => %{
            "name" => "John Doe",
            "email" => "john@mail.com"
          }
        }
      }

      assert expected_response = response
    end
  end

  describe "createTraining/1" do
    test "creates a training", %{conn: conn} do
      user = %{name: "John Doe", email: "john@mail.com", password: "123456"}
      {:ok, %User{id: user_id}} = User.Create.call(user)

      mutation = """
      mutation {
        createTraining(input: {
          userId: "#{user_id}",
          startDate: "2021-08-18",
          endDate: "2021-09-18",
          exercises: [
            {
              name: "Exercise",
              description: "Description",
              repetitions: "3x15",
              videoUrl: "video.com"
            }
          ]
        }) {
          id,
          start_date,
          end_date,
          exercises {
            id,
            name,
            description,
            repetitions,
            videoUrl
          }
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "createTraining" => %{
            "start_date" => "2021-08-18",
            "end_date" => "2021-09-18",
            "exercises" => [
              %{
                "name" => "Exercise",
                "description" => "Description",
                "repetitions" => "3x15",
                "videoUrl" => "video.com"
              }
            ]
          }
        }
      }

      assert expected_response = response
    end
  end
end
