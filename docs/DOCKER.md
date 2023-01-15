# Docker 

For this example project Docker has two uses:

1. Local development database
2. Deploying the Elixir/Phoenix project in remote staging/prod environments 

## Local Database

The [docker-compose.yml](docker-compose.yml) file defines local databases. When you run `docker-compose up` the databases defined in this file will be spun up. If existing data is found in your local `dbdata` directory, that will feed the Docker database, otherwise a new, empty database will be generated.

With the local Docker database running, using `mix ecto.setup` or `mix ecto.migrate` will create or update the project-specific schema. Running `mix ecto.setup` is required the first time you are launching the app.

## Deployment Containers

## TODOs

- [] Details on deployment container