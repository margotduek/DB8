defmodule Db8.Tournament do
  use Db8.Web, :model

  schema "tournament" do
    field :name, :string
    field :host, :integer
    field :admin, :integer
  end

  @required_fields ~w(name host admin)
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
