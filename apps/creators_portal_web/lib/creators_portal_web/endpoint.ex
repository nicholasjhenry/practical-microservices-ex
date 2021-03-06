defmodule CreatorsPortalWeb.Endpoint do
  @moduledoc false

  use Phoenix.Endpoint, otp_app: :creators_portal_web

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_creators_portal_key",
    signing_salt: "EHgI5Pz8"
  ]

  socket "/creators_portal/socket", CreatorsPortalWeb.UserSocket,
    websocket: [timeout: 45_000],
    longpoll: false

  socket "/creators_portal/live", Phoenix.LiveView.Socket,
    websocket: [
      timeout: 45_000,
      connect_info: [session: @session_options]
    ]

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/creators_portal",
    from: :creators_portal_web,
    gzip: false,
    only: ~w(css fonts images img js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket/creators_portal", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug CreatorsPortalWeb.Router
end
