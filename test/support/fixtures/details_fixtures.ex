defmodule PhoenixFromScratch.DetailsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixFromScratch.Details` context.
  """

  @doc """
  Generate a pet.
  """
  def pet_fixture(attrs \\ %{}) do
    {:ok, pet} =
      attrs
      |> Enum.into(%{
        breed: "some breed",
        dob: ~N[2023-01-15 04:37:00],
        name: "some name",
        species: "some species"
      })
      |> PhoenixFromScratch.Details.create_pet()

    pet
  end
end
