# PhoenixFromScratch

A sandbox for figuring out how to create a new Elixir/Phoenix project

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
- [] Display table data (choose library)
- [] Accounts: admin, user
- [] Admin login/authentication
- [] Cloud provider
- [] Terraform


## Tools/Libraries Used

| Tool / Library                                      | Useage                          |
| --------------------------------------------------- | ------------------------------- |
| [asdf](https://asdf-vm.com)                         | Tool version manager            |
| [Docker](https://www.docker.com)                    | Containers                      |
| [Guardian](https://github.com/ueberauth/guardian)   | Authentication                  |
