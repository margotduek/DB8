defmodule Db8.TournamentJudgeControllerTest do
  use Db8.ConnCase

  alias Db8.TournamentJudge
  @valid_attrs %{affiliaffiliationSchoolId: 42, tournamentId: 42, userId: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, tournament_judge_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing tournament judges"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, tournament_judge_path(conn, :new)
    assert html_response(conn, 200) =~ "New tournament judge"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, tournament_judge_path(conn, :create), tournament_judge: @valid_attrs
    assert redirected_to(conn) == tournament_judge_path(conn, :index)
    assert Repo.get_by(TournamentJudge, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, tournament_judge_path(conn, :create), tournament_judge: @invalid_attrs
    assert html_response(conn, 200) =~ "New tournament judge"
  end

  test "shows chosen resource", %{conn: conn} do
    tournament_judge = Repo.insert! %TournamentJudge{}
    conn = get conn, tournament_judge_path(conn, :show, tournament_judge)
    assert html_response(conn, 200) =~ "Show tournament judge"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, tournament_judge_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    tournament_judge = Repo.insert! %TournamentJudge{}
    conn = get conn, tournament_judge_path(conn, :edit, tournament_judge)
    assert html_response(conn, 200) =~ "Edit tournament judge"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    tournament_judge = Repo.insert! %TournamentJudge{}
    conn = put conn, tournament_judge_path(conn, :update, tournament_judge), tournament_judge: @valid_attrs
    assert redirected_to(conn) == tournament_judge_path(conn, :show, tournament_judge)
    assert Repo.get_by(TournamentJudge, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    tournament_judge = Repo.insert! %TournamentJudge{}
    conn = put conn, tournament_judge_path(conn, :update, tournament_judge), tournament_judge: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit tournament judge"
  end

  test "deletes chosen resource", %{conn: conn} do
    tournament_judge = Repo.insert! %TournamentJudge{}
    conn = delete conn, tournament_judge_path(conn, :delete, tournament_judge)
    assert redirected_to(conn) == tournament_judge_path(conn, :index)
    refute Repo.get(TournamentJudge, tournament_judge.id)
  end
end
