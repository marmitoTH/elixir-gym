defmodule ElixirgymWeb.Resolvers.User do
  def get(%{id: user_id}, _context), do: Elixirgym.User.Get.call(user_id)
  def create(%{input: params}, _context), do: Elixirgym.User.Create.call(params)
end
