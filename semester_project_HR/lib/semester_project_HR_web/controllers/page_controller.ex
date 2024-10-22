defmodule SemesterProject_HRWeb.PageController do
  use SemesterProject_HRWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
end
