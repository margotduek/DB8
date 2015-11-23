defmodule Db8.TeamTest do
  use Db8.ModelCase

  alias Db8.Team

  @valid_attrs %{affiliationschoolid: 42, firstmember: 42, name: "some content", secondmember: 42, thirdmember: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Team.changeset(%Team{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Team.changeset(%Team{}, @invalid_attrs)
    refute changeset.valid?
  end
end
