defmodule SemesterProject_HR.HR.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :department, :string
    field :employee_id, :integer
    field :firstname, :string
    field :hiredate, :date
    field :lastname, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:employee_id, :lastname, :firstname, :hiredate, :department])
    |> validate_required([:employee_id, :lastname, :firstname, :hiredate, :department])
  end
end
