defmodule SemesterProject_HR.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :employee_id, :integer
      add :lastname, :string
      add :firstname, :string
      add :hiredate, :date
      add :department, :string

      timestamps()
    end
  end
end
