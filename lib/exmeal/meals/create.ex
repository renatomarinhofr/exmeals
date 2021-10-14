defmodule Exmeal.Meals.Create do

  alias Exmeal.{Meal, Repo}


  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
  end
end
