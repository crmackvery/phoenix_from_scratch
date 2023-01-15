defmodule PhoenixFromScratch.Accounts do
  @moduledoc """

  """

  import Ecto.Query
  alias PhoenixFromScratch.Repo

  alias PhoenixFromScratch.Schemas.Admin

  def create_admin(attrs) do
    %Admin{}
    |> Admin.registration_changeset(attrs)
    |> Repo.insert()
  end

  def get_admin!(id) do
    
  end
end
