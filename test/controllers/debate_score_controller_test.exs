defmodule Db8.DebateScoreControllerTest do
  use Db8.ConnCase

  alias Db8.DebateScore
  @valid_attrs %{content: 42, debate: 42, debateRole: 42, debater: 42, strategy: 42, style: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, debate_score_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing debate scores"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, debate_score_path(conn, :new)
    assert html_response(conn, 200) =~ "New debate score"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, debate_score_path(conn, :create), debate_score: @valid_attrs
    assert redirected_to(conn) == debate_score_path(conn, :index)
    assert Repo.get_by(DebateScore, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, debate_score_path(conn, :create), debate_score: @invalid_attrs
    assert html_response(conn, 200) =~ "New debate score"
  end

  test "shows chosen resource", %{conn: conn} do
    debate_score = Repo.insert! %DebateScore{}
    conn = get conn, debate_score_path(conn, :show, debate_score)
    assert html_response(conn, 200) =~ "Show debate score"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, debate_score_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    debate_score = Repo.insert! %DebateScore{}
    conn = get conn, debate_score_path(conn, :edit, debate_score)
    assert html_response(conn, 200) =~ "Edit debate score"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    debate_score = Repo.insert! %DebateScore{}
    conn = put conn, debate_score_path(conn, :update, debate_score), debate_score: @valid_attrs
    assert redirected_to(conn) == debate_score_path(conn, :show, debate_score)
    assert Repo.get_by(DebateScore, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    debate_score = Repo.insert! %DebateScore{}
    conn = put conn, debate_score_path(conn, :update, debate_score), debate_score: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit debate score"
  end

  test "deletes chosen resource", %{conn: conn} do
    debate_score = Repo.insert! %DebateScore{}
    conn = delete conn, debate_score_path(conn, :delete, debate_score)
    assert redirected_to(conn) == debate_score_path(conn, :index)
    refute Repo.get(DebateScore, debate_score.id)
  end
end
