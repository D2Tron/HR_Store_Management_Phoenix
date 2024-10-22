defmodule SemesterProject_HRWeb.ErrorJSONTest do
  use SemesterProject_HRWeb.ConnCase, async: true

  test "renders 404" do
    assert SemesterProject_HRWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert SemesterProject_HRWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
