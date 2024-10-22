defmodule SemesterProject_HR.HRFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SemesterProject_HR.HR` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        department: "some department",
        employee_id: 42,
        firstname: "some firstname",
        hiredate: ~D[2023-05-02],
        lastname: "some lastname"
      })
      |> SemesterProject_HR.HR.create_employee()

    employee
  end
end
