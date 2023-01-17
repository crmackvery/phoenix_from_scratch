defmodule PhoenixFromScratch.DetailsTest do
  use PhoenixFromScratch.DataCase

  alias PhoenixFromScratch.Details

  describe "pets" do
    alias PhoenixFromScratch.Details.Pet

    import PhoenixFromScratch.DetailsFixtures

    @invalid_attrs %{breed: nil, dob: nil, name: nil, species: nil}

    test "list_pets/0 returns all pets" do
      pet = pet_fixture()
      assert Details.list_pets() == [pet]
    end

    test "get_pet!/1 returns the pet with given id" do
      pet = pet_fixture()
      assert Details.get_pet!(pet.id) == pet
    end

    test "create_pet/1 with valid data creates a pet" do
      valid_attrs = %{
        breed: "some breed",
        dob: ~N[2023-01-15 04:37:00],
        name: "some name",
        species: "some species"
      }

      assert {:ok, %Pet{} = pet} = Details.create_pet(valid_attrs)
      assert pet.breed == "some breed"
      assert pet.dob == ~N[2023-01-15 04:37:00]
      assert pet.name == "some name"
      assert pet.species == "some species"
    end

    test "create_pet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Details.create_pet(@invalid_attrs)
    end

    test "update_pet/2 with valid data updates the pet" do
      pet = pet_fixture()

      update_attrs = %{
        breed: "some updated breed",
        dob: ~N[2023-01-16 04:37:00],
        name: "some updated name",
        species: "some updated species"
      }

      assert {:ok, %Pet{} = pet} = Details.update_pet(pet, update_attrs)
      assert pet.breed == "some updated breed"
      assert pet.dob == ~N[2023-01-16 04:37:00]
      assert pet.name == "some updated name"
      assert pet.species == "some updated species"
    end

    test "update_pet/2 with invalid data returns error changeset" do
      pet = pet_fixture()
      assert {:error, %Ecto.Changeset{}} = Details.update_pet(pet, @invalid_attrs)
      assert pet == Details.get_pet!(pet.id)
    end

    test "delete_pet/1 deletes the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{}} = Details.delete_pet(pet)
      assert_raise Ecto.NoResultsError, fn -> Details.get_pet!(pet.id) end
    end

    test "change_pet/1 returns a pet changeset" do
      pet = pet_fixture()
      assert %Ecto.Changeset{} = Details.change_pet(pet)
    end
  end
end
