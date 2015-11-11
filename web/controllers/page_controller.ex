defmodule Db8.PageController do
  use Db8.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
