defmodule SemesterProject.SMSFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SemesterProject.SMS` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        location: "some location",
        store_id: 42
      })
      |> SemesterProject.SMS.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        count: 42,
        name: "some name",
        retailprice: 120.5,
        vendor: "some vendor",
        wholesaleprice: 120.5
      })
      |> SemesterProject.SMS.create_product()

    product
  end
end
