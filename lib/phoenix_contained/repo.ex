defmodule PhoenixContained.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_contained,
    adapter: Ecto.Adapters.Postgres
end
