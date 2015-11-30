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
    resources "/schools", SchoolController
    get "/debate_role", DebateRoleController, :index
    resources "/teams", TeamController
    resources "/tournaments", TournamentController
    resources "/tournament_judges", TournamentJudgeController
    resources "/tournament_coaches", TournamentCoachController
    resources "/tournament_teams", TournamentTeamController
    resources "/debates", DebateController
    resources "/debate_scores", DebateScoreController
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Db8 do
  #   pipe_through :api
  # end
end
