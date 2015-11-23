defmodule Db8.Repo.Migrations.CreateTournamentCoach do
  use Ecto.Migration

  def change do
    create table(:tournament_coaches) do
      add :tournamentid, :integer
      add :affiliaffiliationschoolid, :integer
      add :userid, :integer

      timestamps
    end

  end
end
