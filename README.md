<center>
  <h3><strong>ElixirGym</strong></h3>
</center>
</br>

## 🔍 About

ElixirGym is a backend application developed with Phoenix Framework. My object with this tool was to learn the principles behind web development with functional programming, using Elixir and GraphQL architecture. The application consists of an API capable of register users, trainings and exercises data, emulating what would be a system for a gym.

## 🔧 Made With

- [Elixir](https://elixir-lang.org/)
- [Phoenix](https://phoenixframework.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [GraphQL](https://graphql.org/)

## 🔌 Installation

Run the following commands on the project's root folder:

```
mix deps.get      # Install all dependencies
mix ecto.setup    # Setup the database
mix phx.server    # Start the application
mix test          # Run test suites
```

The server will be listening to the port `4000`.

## 🎲 GraphQL Schemas

The application implements a GraphQL API at `/api/graphql`.

### Types

```
User {
  id: UUID4!
  name: String!
  email: String!
  training: Training!
}

Training {
  id: UUID4!
  startDate: String!
  endDate: String!
  exercises: [Exercise]
}

Exercise {
  id: UUID4!
  name: String!
  description: String!
  repetitions: String!
  videoUrl: String!
}
```

### Queries

```
getUser(id: UUID4!): User
```

### Mutations

```
createUser(input: CreateUserInput!): User
createTraining(input: CreateTrainingInput!): Training
```
