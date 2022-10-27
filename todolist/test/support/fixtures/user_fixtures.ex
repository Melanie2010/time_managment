defmodule Todolist.UserFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.User` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        status: "some status",
        title: "some title"
      })
      |> Todolist.User.create_task()

    task
  end
end
