defmodule PhoenixFromScratch.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_from_scratch,
    adapter: Ecto.Adapters.Postgres
end
