defmodule PhoenixFromScratch.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :species, :string
      add :breed, :string
      add :dob, :naive_datetime
      add :user_id, references(:users, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:pets, [:user_id])
  end
end
