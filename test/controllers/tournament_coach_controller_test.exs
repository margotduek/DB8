defmodule Db8.TournamentCoachControllerTest do
  use Db8.ConnCase

  alias Db8.TournamentCoach
  @valid_attrs %{affiliaffiliationschoolid: 42, tournamentid: 42, userid: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, tournament_coach_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing tournament coaches"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, tournament_coach_path(conn, :new)
    assert html_response(conn, 200) =~ "New tournament coach"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, tournament_coach_path(conn, :create), tournament_coach: @valid_attrs
    assert redirected_to(conn) == tournament_coach_path(conn, :index)
    assert Repo.get_by(TournamentCoach, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, tournament_coach_path(conn, :create), tournament_coach: @invalid_attrs
    assert html_response(conn, 200) =~ "New tournament coach"
  end

  test "shows chosen resource", %{conn: conn} do
    tournament_coach = Repo.insert! %TournamentCoach{}
    conn = get conn, tournament_coach_path(conn, :show, tournament_coach)
    assert html_response(conn, 200) =~ "Show tournament coach"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, tournament_coach_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    tournament_coach = Repo.insert! %TournamentCoach{}
    conn = get conn, tournament_coach_path(conn, :edit, tournament_coach)
    assert html_response(conn, 200) =~ "Edit tournament coach"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    tournament_coach = Repo.insert! %TournamentCoach{}
    conn = put conn, tournament_coach_path(conn, :update, tournament_coach), tournament_coach: @valid_attrs
    assert redirected_to(conn) == tournament_coach_path(conn, :show, tournament_coach)
    assert Repo.get_by(TournamentCoach, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    tournament_coach = Repo.insert! %TournamentCoach{}
    conn = put conn, tournament_coach_path(conn, :update, tournament_coach), tournament_coach: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit tournament coach"
  end

  test "deletes chosen resource", %{conn: conn} do
    tournament_coach = Repo.insert! %TournamentCoach{}
    conn = delete conn, tournament_coach_path(conn, :delete, tournament_coach)
    assert redirected_to(conn) == tournament_coach_path(conn, :index)
    refute Repo.get(TournamentCoach, tournament_coach.id)
  end
end
