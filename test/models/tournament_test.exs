defmodule Db8.TournamentTest do
  use Db8.ModelCase

  alias Db8.Tournament

  @valid_attrs %{admin: 42, host: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Tournament.changeset(%Tournament{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Tournament.changeset(%Tournament{}, @invalid_attrs)
    refute changeset.valid?
  end
end
