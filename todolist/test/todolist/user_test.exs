defmodule Todolist.UserTest do
  use Todolist.DataCase

  alias Todolist.User

  describe "task" do
    alias Todolist.User.Task

    import Todolist.UserFixtures

    @invalid_attrs %{description: nil, status: nil, title: nil}

    test "list_task/0 returns all task" do
      task = task_fixture()
      assert User.list_task() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert User.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{description: "some description", status: "some status", title: "some title"}

      assert {:ok, %Task{} = task} = User.create_task(valid_attrs)
      assert task.description == "some description"
      assert task.status == "some status"
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{description: "some updated description", status: "some updated status", title: "some updated title"}

      assert {:ok, %Task{} = task} = User.update_task(task, update_attrs)
      assert task.description == "some updated description"
      assert task.status == "some updated status"
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_task(task, @invalid_attrs)
      assert task == User.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = User.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> User.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = User.change_task(task)
    end
  end
end
