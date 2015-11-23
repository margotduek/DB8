defmodule Db8.TournamentCoachController do
  use Db8.Web, :controller

  alias Db8.TournamentCoach

  plug :scrub_params, "tournament_coach" when action in [:create, :update]

  def index(conn, _params) do
    tournament_coaches = Repo.all(TournamentCoach)
    render(conn, "index.html", tournament_coaches: tournament_coaches)
  end

  def new(conn, _params) do
    changeset = TournamentCoach.changeset(%TournamentCoach{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tournament_coach" => tournament_coach_params}) do
    changeset = TournamentCoach.changeset(%TournamentCoach{}, tournament_coach_params)

    case Repo.insert(changeset) do
      {:ok, _tournament_coach} ->
        conn
        |> put_flash(:info, "Tournament coach created successfully.")
        |> redirect(to: tournament_coach_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tournament_coach = Repo.get!(TournamentCoach, id)
    render(conn, "show.html", tournament_coach: tournament_coach)
  end

  def edit(conn, %{"id" => id}) do
    tournament_coach = Repo.get!(TournamentCoach, id)
    changeset = TournamentCoach.changeset(tournament_coach)
    render(conn, "edit.html", tournament_coach: tournament_coach, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tournament_coach" => tournament_coach_params}) do
    tournament_coach = Repo.get!(TournamentCoach, id)
    changeset = TournamentCoach.changeset(tournament_coach, tournament_coach_params)

    case Repo.update(changeset) do
      {:ok, tournament_coach} ->
        conn
        |> put_flash(:info, "Tournament coach updated successfully.")
        |> redirect(to: tournament_coach_path(conn, :show, tournament_coach))
      {:error, changeset} ->
        render(conn, "edit.html", tournament_coach: tournament_coach, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tournament_coach = Repo.get!(TournamentCoach, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(tournament_coach)

    conn
    |> put_flash(:info, "Tournament coach deleted successfully.")
    |> redirect(to: tournament_coach_path(conn, :index))
  end
end
