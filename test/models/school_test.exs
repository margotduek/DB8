defmodule Db8.SchoolTest do
  use Db8.ModelCase

  alias Db8.School

  @valid_attrs %{address: "some content", name: "some content", phone: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = School.changeset(%School{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = School.changeset(%School{}, @invalid_attrs)
    refute changeset.valid?
  end
end
