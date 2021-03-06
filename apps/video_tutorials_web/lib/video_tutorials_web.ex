defmodule VideoTutorialsWeb do
  @moduledoc """
  The entrypoint for video tutorials.
  """

  @doc false
  def controller do
    quote do
      @moduledoc false

      use Phoenix.Controller, namespace: VideoTutorialsWeb

      import Plug.Conn
      import VideoTutorialsWeb.Gettext
      alias VideoTutorialsWeb.Router.Helpers, as: Routes
    end
  end

  @doc false
  def view do
    quote do
      @moduledoc false

      use Phoenix.View,
        root: "lib/video_tutorials_web/templates",
        namespace: VideoTutorialsWeb

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

      # Include shared imports and aliases for views
      unquote(view_helpers())
    end
  end

  @doc false
  def live_view do
    quote do
      @moduledoc false

      use Phoenix.LiveView,
        layout: {VideoTutorialsWeb.LayoutView, "live.html"}

      unquote(view_helpers())
    end
  end

  @doc false
  def live_component do
    quote do
      @moduledoc false

      use Phoenix.LiveComponent

      unquote(view_helpers())
    end
  end

  @doc false
  def router do
    quote do
      @moduledoc false

      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  @doc false
  def channel do
    quote do
      @moduledoc false

      use Phoenix.Channel
      import VideoTutorialsWeb.Gettext
    end
  end

  @doc false
  defp view_helpers do
    quote do
      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      # Import LiveView helpers (live_render, live_component, live_patch, etc)
      import Phoenix.LiveView.Helpers

      # Import basic rendering functionality (render, render_layout, etc)
      import Phoenix.View

      import VideoTutorialsWeb.ErrorHelpers
      import VideoTutorialsWeb.Gettext
      alias VideoTutorialsWeb.Router.Helpers, as: Routes
    end
  end

  @doc false
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
