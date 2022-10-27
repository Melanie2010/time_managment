defmodule Todolist.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.Catalog` context.
  """

  @doc """
  Generate a working_times.
  """
  def working_times_fixture(attrs \\ %{}) do
    {:ok, working_times} =
      attrs
      |> Enum.into(%{
        end: ~N[2022-10-24 13:09:00],
        start: ~N[2022-10-24 13:09:00]

      })
      |> Todolist.Catalog.create_working_times()

    working_times
  end

  @doc """
  Generate a clocks.
  """
  def clocks_fixture(attrs \\ %{}) do
    {:ok, clocks} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2022-10-24 11:24:00]
      })
      |> Todolist.Catalog.create_clocks()

    clocks
  end

end
