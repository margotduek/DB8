defmodule Db8.SchoolController do
  use Db8.Web, :controller

  alias Db8.School

  plug :scrub_params, "school" when action in [:create, :update]

  def index(conn, _params) do
    schools = Repo.all(School)
    render(conn, "index.html", schools: schools)
  end

  def new(conn, _params) do
    changeset = School.changeset(%School{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"school" => school_params}) do
    changeset = School.changeset(%School{}, school_params)

    case Repo.insert(changeset) do
      {:ok, _school} ->
        conn
        |> put_flash(:info, "School created successfully.")
        |> redirect(to: school_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    school = Repo.get!(School, id)
    render(conn, "show.html", school: school)
  end

  def edit(conn, %{"id" => id}) do
    school = Repo.get!(School, id)
    changeset = School.changeset(school)
    render(conn, "edit.html", school: school, changeset: changeset)
  end

  def update(conn, %{"id" => id, "school" => school_params}) do
    school = Repo.get!(School, id)
    changeset = School.changeset(school, school_params)

    case Repo.update(changeset) do
      {:ok, school} ->
        conn
        |> put_flash(:info, "School updated successfully.")
        |> redirect(to: school_path(conn, :show, school))
      {:error, changeset} ->
        render(conn, "edit.html", school: school, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    school = Repo.get!(School, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(school)

    conn
    |> put_flash(:info, "School deleted successfully.")
    |> redirect(to: school_path(conn, :index))
  end
end
