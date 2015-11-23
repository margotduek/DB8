defmodule Db8.DebateRoleController do
  use Db8.Web, :controller

  alias Db8.DebateRole

  plug :scrub_params, "debate_role" when action in [:create, :update]

  def index(conn, _params) do
    debate_role = Repo.all(DebateRole)
    render(conn, "index.html", debate_role: debate_role)
  end

  def new(conn, _params) do
    changeset = DebateRole.changeset(%DebateRole{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"debate_role" => debate_role_params}) do
    changeset = DebateRole.changeset(%DebateRole{}, debate_role_params)

    case Repo.insert(changeset) do
      {:ok, _debate_role} ->
        conn
        |> put_flash(:info, "Debate role created successfully.")
        |> redirect(to: debate_role_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    debate_role = Repo.get!(DebateRole, id)
    render(conn, "show.html", debate_role: debate_role)
  end

  def edit(conn, %{"id" => id}) do
    debate_role = Repo.get!(DebateRole, id)
    changeset = DebateRole.changeset(debate_role)
    render(conn, "edit.html", debate_role: debate_role, changeset: changeset)
  end

  def update(conn, %{"id" => id, "debate_role" => debate_role_params}) do
    debate_role = Repo.get!(DebateRole, id)
    changeset = DebateRole.changeset(debate_role, debate_role_params)

    case Repo.update(changeset) do
      {:ok, debate_role} ->
        conn
        |> put_flash(:info, "Debate role updated successfully.")
        |> redirect(to: debate_role_path(conn, :show, debate_role))
      {:error, changeset} ->
        render(conn, "edit.html", debate_role: debate_role, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    debate_role = Repo.get!(DebateRole, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(debate_role)

    conn
    |> put_flash(:info, "Debate role deleted successfully.")
    |> redirect(to: debate_role_path(conn, :index))
  end
end
