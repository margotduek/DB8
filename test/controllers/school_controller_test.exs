defmodule Db8.SchoolControllerTest do
  use Db8.ConnCase

  alias Db8.School
  @valid_attrs %{address: "some content", name: "some content", phone: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, school_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing schools"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, school_path(conn, :new)
    assert html_response(conn, 200) =~ "New school"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, school_path(conn, :create), school: @valid_attrs
    assert redirected_to(conn) == school_path(conn, :index)
    assert Repo.get_by(School, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, school_path(conn, :create), school: @invalid_attrs
    assert html_response(conn, 200) =~ "New school"
  end

  test "shows chosen resource", %{conn: conn} do
    school = Repo.insert! %School{}
    conn = get conn, school_path(conn, :show, school)
    assert html_response(conn, 200) =~ "Show school"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, school_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    school = Repo.insert! %School{}
    conn = get conn, school_path(conn, :edit, school)
    assert html_response(conn, 200) =~ "Edit school"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    school = Repo.insert! %School{}
    conn = put conn, school_path(conn, :update, school), school: @valid_attrs
    assert redirected_to(conn) == school_path(conn, :show, school)
    assert Repo.get_by(School, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    school = Repo.insert! %School{}
    conn = put conn, school_path(conn, :update, school), school: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit school"
  end

  test "deletes chosen resource", %{conn: conn} do
    school = Repo.insert! %School{}
    conn = delete conn, school_path(conn, :delete, school)
    assert redirected_to(conn) == school_path(conn, :index)
    refute Repo.get(School, school.id)
  end
end
