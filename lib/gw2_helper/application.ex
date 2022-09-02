defmodule Gw2Helper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Gw2Helper.Repo,
      # Start the Telemetry supervisor
      Gw2HelperWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Gw2Helper.PubSub},
      # Start the Endpoint (http/https)
      Gw2HelperWeb.Endpoint,
      # Finch worker
      {Finch, name: Gw2Finch}
      # Start a worker by calling: Gw2Helper.Worker.start_link(arg)
      # {Gw2Helper.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gw2Helper.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Gw2HelperWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
