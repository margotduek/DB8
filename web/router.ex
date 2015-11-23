defmodule Db8.Router do
  use Db8.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug DB8.Auth, repo: DB8.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Db8 do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/books", BookController

  end

  # Other scopes may use custom stacks.
  # scope "/api", Db8 do
  #   pipe_through :api
  # end
end
