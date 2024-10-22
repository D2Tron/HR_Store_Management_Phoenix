defmodule SemesterProject_HR.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SemesterProject_HRWeb.Telemetry,
      # Start the Ecto repository
      SemesterProject_HR.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SemesterProject_HR.PubSub},
      # Start Finch
      {Finch, name: SemesterProject_HR.Finch},
      # Start the Endpoint (http/https)
      SemesterProject_HRWeb.Endpoint
      # Start a worker by calling: SemesterProject_HR.Worker.start_link(arg)
      # {SemesterProject_HR.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SemesterProject_HR.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SemesterProject_HRWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
