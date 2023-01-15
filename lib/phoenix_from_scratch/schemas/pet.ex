defmodule PhoenixFromScratch.Schemas.Pet do

  use PhoenixFromScratch.Schema

  schema "pets" do
    field :name, :string
    field :species, :string
    field :breed, :string
    field :dob, :utc_datetime

    timestamps()
  end

  
end
