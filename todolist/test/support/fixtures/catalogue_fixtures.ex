defmodule Todolist.CatalogueFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.Catalogue` context.
  """

  @doc """
  Generate a clocks.
  """
  def clocks_fixture(attrs \\ %{}) do
    {:ok, clocks} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2022-10-24 11:41:00]
      })
      |> Todolist.Catalogue.create_clocks()

    clocks
  end
end
