defmodule ElixirgymWeb.Resolvers.Training do
  def create(%{input: params}, _context), do: Elixirgym.Training.Create.call(params)
end
