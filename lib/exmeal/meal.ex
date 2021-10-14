defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:descricao, :data, :calorias]

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories]}

  schema "meals" do
    field :descricao, :string
    field :data, :naive_datetime
    field :calorias, :integer

    timestamps()
  end

  def changeset(changeset \\ %__MODULE__{}, params) do
    changeset
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:descricao, min: 3)
    |> validate_number(:calorias, greater_than_or_equal_to: 1)
  end
end
