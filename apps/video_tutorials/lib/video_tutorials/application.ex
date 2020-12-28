defmodule VideoTutorials.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @mix_env Mix.env()

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      VideoTutorials.Repo,
      MessageStore.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: VideoTutorials.PubSub}
      # Start a worker by calling: VideoTutorials.Worker.start_link(arg)
      # {VideoTutorials.Worker, arg}
    ] ++ aggregators(@mix_env)

    Supervisor.start_link(children, strategy: :one_for_one, name: VideoTutorials.Supervisor)
  end

  defp aggregators(:test), do: []
  defp aggregators(_env) do
    [
      {
        MessageStore.SubscriberWorker,
        [config: %{stream_name: "aggregators:home-page", subscribed_to: "viewing", handler: VideoTutorials.HomePage}]
      }
    ]
  end
end
