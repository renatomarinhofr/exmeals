defmodule Exmeal.Meals.Create do

  alias Exmeal.{Meal, Repo}


  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, %{status: :bad_request, result: result}}
  end
end
