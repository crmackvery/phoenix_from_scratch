defmodule PhoenixFromScratch.Repo do
  @moduledoc false
  use Ecto.Repo,
    otp_app: :phoenix_from_scratch,
    adapter: Ecto.Adapters.Postgres
end
