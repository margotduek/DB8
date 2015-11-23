defmodule Db8.TournamentTeamController do
  use Db8.Web, :controller

  alias Db8.TournamentTeam

  plug :scrub_params, "tournament_team" when action in [:create, :update]

  def index(conn, _params) do
    tournament_teams = Repo.all(TournamentTeam)
    render(conn, "index.html", tournament_teams: tournament_teams)
  end

  def new(conn, _params) do
    changeset = TournamentTeam.changeset(%TournamentTeam{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tournament_team" => tournament_team_params}) do
    changeset = TournamentTeam.changeset(%TournamentTeam{}, tournament_team_params)

    case Repo.insert(changeset) do
      {:ok, _tournament_team} ->
        conn
        |> put_flash(:info, "Tournament team created successfully.")
        |> redirect(to: tournament_team_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tournament_team = Repo.get!(TournamentTeam, id)
    render(conn, "show.html", tournament_team: tournament_team)
  end

  def edit(conn, %{"id" => id}) do
    tournament_team = Repo.get!(TournamentTeam, id)
    changeset = TournamentTeam.changeset(tournament_team)
    render(conn, "edit.html", tournament_team: tournament_team, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tournament_team" => tournament_team_params}) do
    tournament_team = Repo.get!(TournamentTeam, id)
    changeset = TournamentTeam.changeset(tournament_team, tournament_team_params)

    case Repo.update(changeset) do
      {:ok, tournament_team} ->
        conn
        |> put_flash(:info, "Tournament team updated successfully.")
        |> redirect(to: tournament_team_path(conn, :show, tournament_team))
      {:error, changeset} ->
        render(conn, "edit.html", tournament_team: tournament_team, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tournament_team = Repo.get!(TournamentTeam, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(tournament_team)

    conn
    |> put_flash(:info, "Tournament team deleted successfully.")
    |> redirect(to: tournament_team_path(conn, :index))
  end
end
