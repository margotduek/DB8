defmodule Db8.DebateRoleTest do
  use Db8.ModelCase

  alias Db8.DebateRole

  @valid_attrs %{role: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DebateRole.changeset(%DebateRole{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DebateRole.changeset(%DebateRole{}, @invalid_attrs)
    refute changeset.valid?
  end
end
