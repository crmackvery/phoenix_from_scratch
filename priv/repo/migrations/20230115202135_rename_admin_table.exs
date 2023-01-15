defmodule PhoenixFromScratch.Repo.Migrations.RenameAdminTable do
  use Ecto.Migration

  def change do
    create table(:admins, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :email, :string
      add :password, :string, null: false

      timestamps()
    end
  end
end
