defmodule PhoenixFromScratchWeb.PageController do
  use PhoenixFromScratchWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
