defmodule Db8.Repo.Migrations.CreateTournamentTeam do
  use Ecto.Migration

  def change do
    create table(:tournament_teams) do
      add :tournamentid, :integer
      add :affiliaffiliationschoolid, :integer
      add :teamid, :integer

      timestamps
    end

  end
end
