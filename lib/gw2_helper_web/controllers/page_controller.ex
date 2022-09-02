defmodule Gw2HelperWeb.PageController do
  use Gw2HelperWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
