defmodule Db8.DebateScoreTest do
  use Db8.ModelCase

  alias Db8.DebateScore

  @valid_attrs %{content: 42, debate: 42, debateRole: 42, debater: 42, strategy: 42, style: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DebateScore.changeset(%DebateScore{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DebateScore.changeset(%DebateScore{}, @invalid_attrs)
    refute changeset.valid?
  end
end
