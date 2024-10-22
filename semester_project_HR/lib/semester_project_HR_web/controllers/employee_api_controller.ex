defmodule SemesterProject_HRWeb.EmployeeApiController do

  alias SemesterProject_HR.HR
  
  use SemesterProject_HRWeb, :controller
  
  def index(conn, _params) do
    employees = HR.list_employees()
    render(conn, :index, employees: employees)
  end
  
end
