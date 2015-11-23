defmodule Db8.TournamentJudge do
  use Db8.Web, :model

  schema "tournament_judges" do
    field :tournamentid, :integer
    field :affiliationschoolid, :integer
    field :userid, :integer
  end

  @required_fields ~w(tournamentId affiliaffiliationSchoolId userId)
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
