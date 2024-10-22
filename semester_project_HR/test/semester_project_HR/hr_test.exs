defmodule SemesterProject_HR.HRTest do
  use SemesterProject_HR.DataCase

  alias SemesterProject_HR.HR

  describe "employees" do
    alias SemesterProject_HR.HR.Employee

    import SemesterProject_HR.HRFixtures

    @invalid_attrs %{department: nil, employee_id: nil, firstname: nil, hiredate: nil, lastname: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert HR.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert HR.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{department: "some department", employee_id: 42, firstname: "some firstname", hiredate: ~D[2023-05-02], lastname: "some lastname"}

      assert {:ok, %Employee{} = employee} = HR.create_employee(valid_attrs)
      assert employee.department == "some department"
      assert employee.employee_id == 42
      assert employee.firstname == "some firstname"
      assert employee.hiredate == ~D[2023-05-02]
      assert employee.lastname == "some lastname"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HR.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{department: "some updated department", employee_id: 43, firstname: "some updated firstname", hiredate: ~D[2023-05-03], lastname: "some updated lastname"}

      assert {:ok, %Employee{} = employee} = HR.update_employee(employee, update_attrs)
      assert employee.department == "some updated department"
      assert employee.employee_id == 43
      assert employee.firstname == "some updated firstname"
      assert employee.hiredate == ~D[2023-05-03]
      assert employee.lastname == "some updated lastname"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = HR.update_employee(employee, @invalid_attrs)
      assert employee == HR.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = HR.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> HR.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = HR.change_employee(employee)
    end
  end
end
