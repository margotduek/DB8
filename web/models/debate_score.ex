defmodule Db8.DebateScore do
  use Db8.Web, :model

  schema "debate_score" do
    field :debater, :integer
    field :debaterole, :integer
    field :debate, :integer
    field :content, :integer
    field :strategy, :integer
    field :style, :integer

  end

  @required_fields ~w(debater debateRole debate content strategy style)
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
