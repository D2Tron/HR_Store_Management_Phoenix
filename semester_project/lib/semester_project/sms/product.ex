defmodule SemesterProject.SMS.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias SemesterProject.SMS.Store

  schema "products" do
    field :count, :integer
    field :name, :string
    field :retailprice, :float
    field :vendor, :string
    field :wholesaleprice, :float
    belongs_to :store, Store

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :vendor, :wholesaleprice, :retailprice, :count, :store_id])
    |> validate_required([:name, :vendor, :wholesaleprice, :retailprice, :count, :store_id])
  end
end
