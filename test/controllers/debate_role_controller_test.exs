defmodule Db8.DebateRoleControllerTest do
  use Db8.ConnCase

  alias Db8.DebateRole
  @valid_attrs %{role: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, debate_role_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing debate role"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, debate_role_path(conn, :new)
    assert html_response(conn, 200) =~ "New debate role"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, debate_role_path(conn, :create), debate_role: @valid_attrs
    assert redirected_to(conn) == debate_role_path(conn, :index)
    assert Repo.get_by(DebateRole, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, debate_role_path(conn, :create), debate_role: @invalid_attrs
    assert html_response(conn, 200) =~ "New debate role"
  end

  test "shows chosen resource", %{conn: conn} do
    debate_role = Repo.insert! %DebateRole{}
    conn = get conn, debate_role_path(conn, :show, debate_role)
    assert html_response(conn, 200) =~ "Show debate role"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, debate_role_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    debate_role = Repo.insert! %DebateRole{}
    conn = get conn, debate_role_path(conn, :edit, debate_role)
    assert html_response(conn, 200) =~ "Edit debate role"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    debate_role = Repo.insert! %DebateRole{}
    conn = put conn, debate_role_path(conn, :update, debate_role), debate_role: @valid_attrs
    assert redirected_to(conn) == debate_role_path(conn, :show, debate_role)
    assert Repo.get_by(DebateRole, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    debate_role = Repo.insert! %DebateRole{}
    conn = put conn, debate_role_path(conn, :update, debate_role), debate_role: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit debate role"
  end

  test "deletes chosen resource", %{conn: conn} do
    debate_role = Repo.insert! %DebateRole{}
    conn = delete conn, debate_role_path(conn, :delete, debate_role)
    assert redirected_to(conn) == debate_role_path(conn, :index)
    refute Repo.get(DebateRole, debate_role.id)
  end
end
