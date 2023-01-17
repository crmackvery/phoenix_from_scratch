# Miscellaneous Setup

This is a place to mention smaller components/setup/tools/etc... which do not need a full doc.

## format.credo

(Credo)[https://github.com/rrrene/credo] is a popular Elixir formatting library. This project uses it to handle the auto-formatting and linting of the code.

The dependency is added as described on the project's Github page:

```
{:credo, "~> 1.6", only: [:dev, :test], runtime: false}
```

To make life a little easier, we also create a custom shortcut to run the command by adding the following alias to the existing `aliases` section in the top level `mix.es` file:

```
"format.credo": ["format", "credo"]
```

To run credo, from the top level execute:

```
mix format.credo
```