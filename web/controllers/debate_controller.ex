defmodule Db8.DebateController do
  use Db8.Web, :controller

  alias Db8.Debate

  plug :scrub_params, "debate" when action in [:create, :update]

  def index(conn, _params) do
    debates = Repo.all(Debate)
    render(conn, "index.html", debates: debates)
  end

  def new(conn, _params) do
    changeset = Debate.changeset(%Debate{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"debate" => debate_params}) do
    changeset = Debate.changeset(%Debate{}, debate_params)

    case Repo.insert(changeset) do
      {:ok, _debate} ->
        conn
        |> put_flash(:info, "Debate created successfully.")
        |> redirect(to: debate_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    debate = Repo.get!(Debate, id)
    render(conn, "show.html", debate: debate)
  end

  def edit(conn, %{"id" => id}) do
    debate = Repo.get!(Debate, id)
    changeset = Debate.changeset(debate)
    render(conn, "edit.html", debate: debate, changeset: changeset)
  end

  def update(conn, %{"id" => id, "debate" => debate_params}) do
    debate = Repo.get!(Debate, id)
    changeset = Debate.changeset(debate, debate_params)

    case Repo.update(changeset) do
      {:ok, debate} ->
        conn
        |> put_flash(:info, "Debate updated successfully.")
        |> redirect(to: debate_path(conn, :show, debate))
      {:error, changeset} ->
        render(conn, "edit.html", debate: debate, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    debate = Repo.get!(Debate, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(debate)

    conn
    |> put_flash(:info, "Debate deleted successfully.")
    |> redirect(to: debate_path(conn, :index))
  end
end
