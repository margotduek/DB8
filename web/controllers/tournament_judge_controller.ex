defmodule Db8.TournamentJudgeController do
  use Db8.Web, :controller

  alias Db8.TournamentJudge

  plug :scrub_params, "tournament_judge" when action in [:create, :update]

  def index(conn, _params) do
    tournament_judges = Repo.all(TournamentJudge)
    render(conn, "index.html", tournament_judges: tournament_judges)
  end

  def new(conn, _params) do
    changeset = TournamentJudge.changeset(%TournamentJudge{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tournament_judge" => tournament_judge_params}) do
    changeset = TournamentJudge.changeset(%TournamentJudge{}, tournament_judge_params)

    case Repo.insert(changeset) do
      {:ok, _tournament_judge} ->
        conn
        |> put_flash(:info, "Tournament judge created successfully.")
        |> redirect(to: tournament_judge_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tournament_judge = Repo.get!(TournamentJudge, id)
    render(conn, "show.html", tournament_judge: tournament_judge)
  end

  def edit(conn, %{"id" => id}) do
    tournament_judge = Repo.get!(TournamentJudge, id)
    changeset = TournamentJudge.changeset(tournament_judge)
    render(conn, "edit.html", tournament_judge: tournament_judge, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tournament_judge" => tournament_judge_params}) do
    tournament_judge = Repo.get!(TournamentJudge, id)
    changeset = TournamentJudge.changeset(tournament_judge, tournament_judge_params)

    case Repo.update(changeset) do
      {:ok, tournament_judge} ->
        conn
        |> put_flash(:info, "Tournament judge updated successfully.")
        |> redirect(to: tournament_judge_path(conn, :show, tournament_judge))
      {:error, changeset} ->
        render(conn, "edit.html", tournament_judge: tournament_judge, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tournament_judge = Repo.get!(TournamentJudge, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(tournament_judge)

    conn
    |> put_flash(:info, "Tournament judge deleted successfully.")
    |> redirect(to: tournament_judge_path(conn, :index))
  end
end
