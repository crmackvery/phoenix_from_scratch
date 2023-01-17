# PhoenixFromScratch

A sandbox for figuring out how to create a new Elixir/Phoenix project.

This is a place for me to learn how to create a new Phoenix project from scratch and add important tooling/features on top of the vanilla project. The goal is to utilize as much built-in Elixir/Phoenix tooling as possible, adding outside dependencies only as necessary.

See [the docs dir](docs/) for more details on various aspects of a basic Elixir/Phoenix application.

## Getting Started

- Install `asdf`
- Use asdf to install the version of the following specified in `.tool-versions`:
  - Erlang
  - Elixir
- Run `docker-compose up` from the root of this project to create the local dev database
- Run `mix deps.get` to retrieve dependencies
- With the Docker database container still running, run `mix ecto.setup` to setup the local database
- Run `iex -S mix phx.server` to start the local server
- Visit [localhost](http://localhost:4000) to confirm the server is running


## TODO

- [x] Basic project setup
- [x] Docker for local Postgres
- [x] First migration
- [x] Display table data (choose library)
- [x] Accounts: admin, user
- [x] Admin login/authentication
- [] Cloud provider
- [] Terraform
- [x] Formatting; mix format.credo
- [] Docker deployments


## Tools/Libraries Used

| Tool / Library                        | Useage                          |
| ------------------------------------- | ------------------------------- |
| [asdf](https://asdf-vm.com)           | Tool version manager            |
| [Docker](https://www.docker.com)      | Containers                      |
| [credo](https://github.com/rrrene/credo)      | Code formatting         |
