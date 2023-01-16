# Creating Database Tables

We use the built in `phx.gen.auth` to generate new account types (see [authentication docs](./AUTHENTICATION.md)). 

Phoenix has another built-in for creating non-account tables: `phx.gen.html` Like `phx.gen.auth`, `html` is a shortcut to provide you with the files needed to create and view a new table: migration, schema, context, controller, and views

## Adding a Schema

The usage of `phx.gen.html` is as follows:

```
mix phx.gen.html <Context Module> <Schema Module> <Schema Table Name> [<Column Name>:<Column Type>]+
```

This generates the migration, schema, controllers, views, and context for the given schema. The command run to generate the HTML for pets is:

```
mix phx.gen.html Details Pet pets name:string species:string breed:string dob:datetime user_id:references:users
```

Note that in this project we opt for binary_ids as the primary key for `pets`, so we change the auto-generated migration to reflect that:

```
create table(:pets, primary_key: false) do
      add :id, :binary_id, primary_key: true
```

And update the `use` at the top of `pet.ex` to use our local Schema module which automatically injects the UUID.

The command line will remind you to rcomplete the setup:

```
Add the resource to your browser scope in lib/phoenix_from_scratch_web/router.ex:

    resources "/pets", PetController

Remember to update your repository by running migrations:

    $ mix ecto.migrate

```

## Result

At this point, you should be able to navigate to your [local server](http://localhost:4000/pets) and see the default page for viewing a schema in Phoenix.
