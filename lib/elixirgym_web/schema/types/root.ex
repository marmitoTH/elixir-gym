defmodule ElixirgymWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias ElixirgymWeb.Resolvers.User, as: UserResolver

  import_types ElixirgymWeb.Schema.Types.User

  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.get/2
    end
  end
end