defmodule Db8.Team do
  use Db8.Web, :model

  schema "team" do
    field :name, :string
    field :affiliationschoolid, :integer
    field :firstmember, :integer
    field :secondmember, :integer
    field :thirdmember, :integer

  end

  @required_fields ~w(name affiliationschoolid firstmember secondmember thirdmember)
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
