defmodule Db8.Repo.Migrations.CreateTournamentJudge do
  use Ecto.Migration

  def change do
    create table(:tournament_judges) do
      add :tournamentId, :integer
      add :affiliaffiliationSchoolId, :integer
      add :userId, :integer

      timestamps
    end

  end
end
