defmodule PhoenixFromScratch.Schemas.Admin do

  use PhoenixFromScratch.Schema
  import Ecto.Changeset

  schema "admins" do
    field :name, :string
    field :email, :string
    field :password, :string

    timestamps()
  end

  def registration_changeset(admin, attrs) do
    admin
    |> cast(attrs, [:name, :email, :password])
    |> validate_email()
    |> validate_password()
  end

  def validate_email(changeset) do
    changeset
    |> validate_required([:email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces")
    |> validate_length(:email, max: 160)
    |> unsafe_validate_unique(:email, PhoenixFromScratch.Repo)
    |> unique_constraint(:email)
  end

  def validate_password(changeset) do
    changeset
    |> validate_required([:password])
    |> validate_length(:password, min: 12, max: 80)
    |> hash_password()
  end

  defp hash_password(changeset) do
    password = get_change(changeset, :password)

    if password && changeset.valid? do
      changeset
      |> delete_change(:password)
      |> put_change(:password, Bcrypt.hash_pwd_salt(password))
    else
      changeset
    end
  end


end
