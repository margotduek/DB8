defmodule Db8.Repo.Migrations.CreateTeam do
  use Ecto.Migration

  def change do
    create table(:team) do
      add :name, :text
      add :affiliationschoolid, :integer
      add :firstmember, :integer
      add :secondmember, :integer
      add :thirdmember, :integer

      timestamps
    end

  end
end
