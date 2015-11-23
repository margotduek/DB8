defmodule Db8.DebateControllerTest do
  use Db8.ConnCase

  alias Db8.Debate
  @valid_attrs %{oppscore: 42, oppteam: 42, propscore: 42, propteam: 42, tournamentid: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, debate_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing debates"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, debate_path(conn, :new)
    assert html_response(conn, 200) =~ "New debate"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, debate_path(conn, :create), debate: @valid_attrs
    assert redirected_to(conn) == debate_path(conn, :index)
    assert Repo.get_by(Debate, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, debate_path(conn, :create), debate: @invalid_attrs
    assert html_response(conn, 200) =~ "New debate"
  end

  test "shows chosen resource", %{conn: conn} do
    debate = Repo.insert! %Debate{}
    conn = get conn, debate_path(conn, :show, debate)
    assert html_response(conn, 200) =~ "Show debate"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, debate_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    debate = Repo.insert! %Debate{}
    conn = get conn, debate_path(conn, :edit, debate)
    assert html_response(conn, 200) =~ "Edit debate"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    debate = Repo.insert! %Debate{}
    conn = put conn, debate_path(conn, :update, debate), debate: @valid_attrs
    assert redirected_to(conn) == debate_path(conn, :show, debate)
    assert Repo.get_by(Debate, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    debate = Repo.insert! %Debate{}
    conn = put conn, debate_path(conn, :update, debate), debate: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit debate"
  end

  test "deletes chosen resource", %{conn: conn} do
    debate = Repo.insert! %Debate{}
    conn = delete conn, debate_path(conn, :delete, debate)
    assert redirected_to(conn) == debate_path(conn, :index)
    refute Repo.get(Debate, debate.id)
  end
end
