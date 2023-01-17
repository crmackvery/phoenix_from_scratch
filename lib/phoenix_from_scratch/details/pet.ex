defmodule PhoenixFromScratch.Details.Pet do
  @moduledoc """
    Schema for Pet
  """
  use PhoenixFromScratch.Schema
  import Ecto.Changeset

  schema "pets" do
    field :breed, :string
    field :dob, :naive_datetime
    field :name, :string
    field :species, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :species, :breed, :dob])
    |> validate_required([:name, :species, :breed, :dob])
  end
end
