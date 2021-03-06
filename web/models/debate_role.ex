defmodule Db8.DebateRole do
  use Db8.Web, :model

  schema "debate_role" do
    field :role, :string
  end

  @required_fields ~w(role)
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
