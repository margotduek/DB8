defmodule Db8.TournamentTeamControllerTest do
  use Db8.ConnCase

  alias Db8.TournamentTeam
  @valid_attrs %{affiliaffiliationschoolid: 42, teamid: 42, tournamentid: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, tournament_team_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing tournament teams"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, tournament_team_path(conn, :new)
    assert html_response(conn, 200) =~ "New tournament team"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, tournament_team_path(conn, :create), tournament_team: @valid_attrs
    assert redirected_to(conn) == tournament_team_path(conn, :index)
    assert Repo.get_by(TournamentTeam, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, tournament_team_path(conn, :create), tournament_team: @invalid_attrs
    assert html_response(conn, 200) =~ "New tournament team"
  end

  test "shows chosen resource", %{conn: conn} do
    tournament_team = Repo.insert! %TournamentTeam{}
    conn = get conn, tournament_team_path(conn, :show, tournament_team)
    assert html_response(conn, 200) =~ "Show tournament team"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, tournament_team_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    tournament_team = Repo.insert! %TournamentTeam{}
    conn = get conn, tournament_team_path(conn, :edit, tournament_team)
    assert html_response(conn, 200) =~ "Edit tournament team"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    tournament_team = Repo.insert! %TournamentTeam{}
    conn = put conn, tournament_team_path(conn, :update, tournament_team), tournament_team: @valid_attrs
    assert redirected_to(conn) == tournament_team_path(conn, :show, tournament_team)
    assert Repo.get_by(TournamentTeam, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    tournament_team = Repo.insert! %TournamentTeam{}
    conn = put conn, tournament_team_path(conn, :update, tournament_team), tournament_team: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit tournament team"
  end

  test "deletes chosen resource", %{conn: conn} do
    tournament_team = Repo.insert! %TournamentTeam{}
    conn = delete conn, tournament_team_path(conn, :delete, tournament_team)
    assert redirected_to(conn) == tournament_team_path(conn, :index)
    refute Repo.get(TournamentTeam, tournament_team.id)
  end
end
