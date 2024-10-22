defmodule SemesterProject_HRWeb.EmployeeApiJSON do
  
  def index(%{employees: employees}) do
    %{data:
      for(employee <- employees) do
        %{id: employee.id, employee_id: employee.employee_id, firstname: employee.firstname, lastname: employee.lastname, hiredate: employee.hiredate, department: employee.department}
      end
    }
  end
end
