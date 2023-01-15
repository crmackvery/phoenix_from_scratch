defmodule PhoenixFromScratch.Repo.Migrations.InitialTable do
  use Ecto.Migration

  def change do
    create table(:pets, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :species, :string
      add :breed, :string
      add :dob, :utc_datetime

      timestamps()
    end
  end
end
