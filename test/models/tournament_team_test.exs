defmodule Db8.TournamentTeamTest do
  use Db8.ModelCase

  alias Db8.TournamentTeam

  @valid_attrs %{affiliaffiliationschoolid: 42, teamid: 42, tournamentid: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TournamentTeam.changeset(%TournamentTeam{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TournamentTeam.changeset(%TournamentTeam{}, @invalid_attrs)
    refute changeset.valid?
  end
end
