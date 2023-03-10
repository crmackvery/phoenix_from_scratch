defmodule PhoenixFromScratchWeb.PetControllerTest do
  use PhoenixFromScratchWeb.ConnCase

  import PhoenixFromScratch.DetailsFixtures

  @create_attrs %{
    breed: "some breed",
    dob: ~N[2023-01-15 04:37:00],
    name: "some name",
    species: "some species"
  }
  @update_attrs %{
    breed: "some updated breed",
    dob: ~N[2023-01-16 04:37:00],
    name: "some updated name",
    species: "some updated species"
  }
  @invalid_attrs %{breed: nil, dob: nil, name: nil, species: nil}

  describe "index" do
    test "lists all pets", %{conn: conn} do
      conn = get(conn, Routes.pet_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pets"
    end
  end

  describe "new pet" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pet_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pet"
    end
  end

  describe "create pet" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pet_path(conn, :create), pet: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pet_path(conn, :show, id)

      conn = get(conn, Routes.pet_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pet"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pet_path(conn, :create), pet: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pet"
    end
  end

  describe "edit pet" do
    setup [:create_pet]

    test "renders form for editing chosen pet", %{conn: conn, pet: pet} do
      conn = get(conn, Routes.pet_path(conn, :edit, pet))
      assert html_response(conn, 200) =~ "Edit Pet"
    end
  end

  describe "update pet" do
    setup [:create_pet]

    test "redirects when data is valid", %{conn: conn, pet: pet} do
      conn = put(conn, Routes.pet_path(conn, :update, pet), pet: @update_attrs)
      assert redirected_to(conn) == Routes.pet_path(conn, :show, pet)

      conn = get(conn, Routes.pet_path(conn, :show, pet))
      assert html_response(conn, 200) =~ "some updated breed"
    end

    test "renders errors when data is invalid", %{conn: conn, pet: pet} do
      conn = put(conn, Routes.pet_path(conn, :update, pet), pet: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pet"
    end
  end

  describe "delete pet" do
    setup [:create_pet]

    test "deletes chosen pet", %{conn: conn, pet: pet} do
      conn = delete(conn, Routes.pet_path(conn, :delete, pet))
      assert redirected_to(conn) == Routes.pet_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.pet_path(conn, :show, pet))
      end
    end
  end

  defp create_pet(_) do
    pet = pet_fixture()
    %{pet: pet}
  end
end
