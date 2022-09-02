defmodule Gw2Helper.Repo do
  use Ecto.Repo,
    otp_app: :gw2_helper,
    adapter: Ecto.Adapters.Postgres
end
