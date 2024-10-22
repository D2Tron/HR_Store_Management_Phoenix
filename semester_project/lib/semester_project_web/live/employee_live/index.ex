defmodule SemesterProjectWeb.EmployeeLive.Index do
  use SemesterProjectWeb, :live_view

  alias SemesterProject.SMS

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :employees, SMS.list_employees())}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Employees")
    |> assign(:employee, nil)
  end


end


