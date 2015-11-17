defmodule Db8.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :password, :string
      add :password_hash, :string
      add :school, :string
      add :points, :integer

      timestamps
    end

  end
end
