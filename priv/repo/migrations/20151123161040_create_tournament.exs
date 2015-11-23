defmodule Db8.Repo.Migrations.CreateTournament do
  use Ecto.Migration

  def change do
    create table(:tournaments) do
      add :name, :text
      add :host, :integer
      add :admin, :integer

      timestamps
    end

  end
end
