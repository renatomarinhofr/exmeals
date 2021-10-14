defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:descricao, :data, :calorias]

  schema "meals" do
    field :descricao, :string
    field :data, :date
    field :calorias, :integer

    timestamps()
  end

  def changeset(changeset \\ %__MODULE__{}, params) do
    changeset
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:descricao, min: 5)
    |> validate_number(:calorias, greater_than_or_equal_to: 1)
  end
end
