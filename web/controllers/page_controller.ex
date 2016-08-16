defmodule MenuMonkey.PageController do
  use MenuMonkey.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
