defmodule Db8.DebateTest do
  use Db8.ModelCase

  alias Db8.Debate

  @valid_attrs %{oppscore: 42, oppteam: 42, propscore: 42, propteam: 42, tournamentid: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Debate.changeset(%Debate{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Debate.changeset(%Debate{}, @invalid_attrs)
    refute changeset.valid?
  end
end
