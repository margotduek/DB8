defmodule Db8.Router do
  use Db8.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Db8 do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/schools", SchoolController
    resources "/debate_role", DebateRoleController
    resources "/teams", TeamController
    resources "/tournaments", TournamentController
    resources "/tournament_judges", TournamentJudgeController
    resources "/tournament_coaches", TournamentCoachController
    resources "/tournament_teams", TournamentTeamController
    resources "/debates", DebateController
    resources "/debate_scores", DebateScoreController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Db8 do
  #   pipe_through :api
  # end
end
