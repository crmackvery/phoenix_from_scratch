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

## Custom Primary Key

We prefer a custom UUID as the primary key, so we need to inject a small bit of code into the auto-generated migration. When the admin table is created, we need to specify that we don't want the default primary key but rather to use a uuid. The net result of this will be the following migration

```
defmodule PhoenixFromScratch.Repo.Migrations.CreateAdminsAuthTables do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:admins, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :citext, null: false
      add :hashed_password, :string, null: false
      add :confirmed_at, :naive_datetime
      timestamps()
    end

    create unique_index(:admins, [:email])

    create table(:admins_tokens, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :admin_id, references(:admins, type: :binary_id, on_delete: :delete_all), null: false
      add :token, :binary, null: false
      add :context, :string, null: false
      add :sent_to, :string
      timestamps(updated_at: false)
    end

    create index(:admins_tokens, [:admin_id])
    create unique_index(:admins_tokens, [:context, :token])
  end
end
```

Finally, in the newly created `admin.ex` and `admin_token.ex` schemas, switch `use Ecto.Schema` to `use PhoenixFromScratch.Schema` which has some code to auto-insert a UUID in the `id` field.

## Finish Creating Account Type

With all of these changes, the following steps need to be run: 

1. `mix deps.get` to fetch the new dependencies
2. `mix ecto.setup` to create the database (or `mix ecto.migrate` if you already have a database)
3. `mix test` to make sure everything worked properly
4. `iex -S mix phx.server` to start the server and confirm you see the register/login links

## Next Steps

The above examples show how to add an Admin account type. You may repeat as desired for other account types such as User, Researcher, etc...

### Authenticate a Route

The primary purpose of authentication is ensuring only those accounts which should have access to certain pages do. This is handled in [router.ex](/lib/phoenix_from_scratch_web/router.ex) using the `require_authenticated_<ROLE>` tag.

In order to prevent any non-admins from accessing the `/pets` page and viewing all user's pets, we can add the following:

```
scope "/", PhoenixFromScratchWeb do
  pipe_through [:browser, :require_authenticated_admin]

  resources "/pets", PetController
end
```

This works in conjunction with the `fetch_current_admin` plug that is added to the `:browser` pipeline at the top of the router.ex file. This has already been added when we created the new account types.

This route says that anybody trying to access `/pets` must be an authenticated admin. If they are, the `PetController` is server, if they are not then they get redirected to a login page.

## TODOs

- [] Auto-generate an admin for dev when build/deploy?
