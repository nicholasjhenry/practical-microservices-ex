defmodule CreatorsPortalWeb.PageLiveTest do
  use CreatorsPortalWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/creators_portal")
    assert disconnected_html =~ "Creators Portal"
    assert render(page_live) =~ "Creators Portal"
  end
end
