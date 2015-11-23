defmodule Db8.DebateScoreController do
  use Db8.Web, :controller

  alias Db8.DebateScore

  plug :scrub_params, "debate_score" when action in [:create, :update]

  def index(conn, _params) do
    debate_scores = Repo.all(DebateScore)
    render(conn, "index.html", debate_scores: debate_scores)
  end

  def new(conn, _params) do
    changeset = DebateScore.changeset(%DebateScore{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"debate_score" => debate_score_params}) do
    changeset = DebateScore.changeset(%DebateScore{}, debate_score_params)

    case Repo.insert(changeset) do
      {:ok, _debate_score} ->
        conn
        |> put_flash(:info, "Debate score created successfully.")
        |> redirect(to: debate_score_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    debate_score = Repo.get!(DebateScore, id)
    render(conn, "show.html", debate_score: debate_score)
  end

  def edit(conn, %{"id" => id}) do
    debate_score = Repo.get!(DebateScore, id)
    changeset = DebateScore.changeset(debate_score)
    render(conn, "edit.html", debate_score: debate_score, changeset: changeset)
  end

  def update(conn, %{"id" => id, "debate_score" => debate_score_params}) do
    debate_score = Repo.get!(DebateScore, id)
    changeset = DebateScore.changeset(debate_score, debate_score_params)

    case Repo.update(changeset) do
      {:ok, debate_score} ->
        conn
        |> put_flash(:info, "Debate score updated successfully.")
        |> redirect(to: debate_score_path(conn, :show, debate_score))
      {:error, changeset} ->
        render(conn, "edit.html", debate_score: debate_score, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    debate_score = Repo.get!(DebateScore, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(debate_score)

    conn
    |> put_flash(:info, "Debate score deleted successfully.")
    |> redirect(to: debate_score_path(conn, :index))
  end
end
