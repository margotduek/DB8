defmodule Db8.Repo.Migrations.CreateDebateScore do
  use Ecto.Migration

  def change do
    create table(:debate_scores) do
      add :debater, :integer
      add :debateRole, :integer
      add :debate, :integer
      add :content, :integer
      add :strategy, :integer
      add :style, :integer

      timestamps
    end

  end
end
