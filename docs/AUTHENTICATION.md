# Authentication Using phx.gen.auth

Phoenix offers a built-in authentication feature called [phx.gen.auth](https://hexdocs.pm/phoenix/mix_phx_gen_auth.html).

This provides a one-line `mix` command to create a type of user for your system (User, Admin, Researcher, etc...).

This doc will explain how phx.gen.auth was used to setup authentication in this project.

## Create an Account Type

From the root level of your app (unless it's an Umbrella app), you may run:

`mix phx.gen.auth Accounts User users`

This creates an `Accounts` context in your app with a `User` account which exists in a database called `users`

Once run, this generates a slew of automated files and updates existing files, some of the highlights:

- Creates the migration to add the account table and the auth table for that account type
- Updates `mix.exs` to add dependencies (on the first run)
- Creates Context for the account type with a bunch of getters/setters for the account and its auth tokens
- Creates a Schema for the account type with relevant changeset functions
- Adds Register/Login links on your main landing page/menus
- Unit tests

## Finish Creating Account Type

With all of these changes, the following steps need to be run: 

1. `mix deps.get` to fetch the new dependencies
2. 'mix ecto.setup' to create the database (or `mix ecto.migrate' if you already have a database)
3. `mix test` to make sure everything worked properly
4. 'iex -S mix phx.server' to start the server and confirm you see the register/login links

## Next Steps



## TODOs

- [] Fill out Next Steps: how to require authentication for a particular route
- [] Try this with a second account type and update as necessary to mention its behavior
- [] Auto-generate an admin for dev when build/deploy?
