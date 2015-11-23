defmodule Db8.School do
  use Db8.Web, :model

  schema "school" do
    field :name, :string
    field :address, :string
    field :phone, :string
  end

  @required_fields ~w(name address phone)
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
