defmodule SemesterProject.SMSTest do
  use SemesterProject.DataCase

  alias SemesterProject.SMS

  describe "stores" do
    alias SemesterProject.SMS.Store

    import SemesterProject.SMSFixtures

    @invalid_attrs %{location: nil, store_id: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert SMS.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert SMS.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{location: "some location", store_id: 42}

      assert {:ok, %Store{} = store} = SMS.create_store(valid_attrs)
      assert store.location == "some location"
      assert store.store_id == 42
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SMS.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{location: "some updated location", store_id: 43}

      assert {:ok, %Store{} = store} = SMS.update_store(store, update_attrs)
      assert store.location == "some updated location"
      assert store.store_id == 43
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = SMS.update_store(store, @invalid_attrs)
      assert store == SMS.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = SMS.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> SMS.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = SMS.change_store(store)
    end
  end

  describe "products" do
    alias SemesterProject.SMS.Product

    import SemesterProject.SMSFixtures

    @invalid_attrs %{count: nil, name: nil, retailprice: nil, vendor: nil, wholesaleprice: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert SMS.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert SMS.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{count: 42, name: "some name", retailprice: 120.5, vendor: "some vendor", wholesaleprice: 120.5}

      assert {:ok, %Product{} = product} = SMS.create_product(valid_attrs)
      assert product.count == 42
      assert product.name == "some name"
      assert product.retailprice == 120.5
      assert product.vendor == "some vendor"
      assert product.wholesaleprice == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SMS.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{count: 43, name: "some updated name", retailprice: 456.7, vendor: "some updated vendor", wholesaleprice: 456.7}

      assert {:ok, %Product{} = product} = SMS.update_product(product, update_attrs)
      assert product.count == 43
      assert product.name == "some updated name"
      assert product.retailprice == 456.7
      assert product.vendor == "some updated vendor"
      assert product.wholesaleprice == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = SMS.update_product(product, @invalid_attrs)
      assert product == SMS.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = SMS.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> SMS.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = SMS.change_product(product)
    end
  end
end
