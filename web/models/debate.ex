defmodule Db8.Debate do
  use Db8.Web, :model

  schema "debate" do
    field :propteam, :integer
    field :oppteam, :integer
    field :propscore, :integer
    field :oppscore, :integer
    field :tournamentid, :integer
    field :motion, :string

  end

  @required_fields ~w(tournamentid propteam oppteam motion)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
