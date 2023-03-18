defmodule PhoenixContained.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhoenixContainedWeb.Telemetry,
      # Start the Ecto repository
      PhoenixContained.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixContained.PubSub},
      # Start Finch
      {Finch, name: PhoenixContained.Finch},
      # Start the Endpoint (http/https)
      PhoenixContainedWeb.Endpoint
      # Start a worker by calling: PhoenixContained.Worker.start_link(arg)
      # {PhoenixContained.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixContained.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixContainedWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
