defmodule Db8.TournamentJudgeTest do
  use Db8.ModelCase

  alias Db8.TournamentJudge

  @valid_attrs %{affiliaffiliationSchoolId: 42, tournamentId: 42, userId: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TournamentJudge.changeset(%TournamentJudge{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TournamentJudge.changeset(%TournamentJudge{}, @invalid_attrs)
    refute changeset.valid?
  end
end
