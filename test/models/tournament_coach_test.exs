defmodule Db8.TournamentCoachTest do
  use Db8.ModelCase

  alias Db8.TournamentCoach

  @valid_attrs %{affiliaffiliationschoolid: 42, tournamentid: 42, userid: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TournamentCoach.changeset(%TournamentCoach{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TournamentCoach.changeset(%TournamentCoach{}, @invalid_attrs)
    refute changeset.valid?
  end
end
