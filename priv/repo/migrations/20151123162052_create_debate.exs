defmodule Db8.Repo.Migrations.CreateDebate do
  use Ecto.Migration

  def change do
    create table(:debates) do
      add :propteam, :integer
      add :oppteam, :integer
      add :propscore, :integer
      add :oppscore, :integer
      add :tournamentid, :integer

      timestamps
    end

  end
end
