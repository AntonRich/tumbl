defmodule Tumbl.Repo do
  use Ecto.Repo,
    otp_app: :tumbl,
    adapter: Ecto.Adapters.Postgres
end
