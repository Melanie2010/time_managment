defmodule Todolist.CatalogTest do
  use Todolist.DataCase

  alias Todolist.Catalog

  describe "workingtimes" do
    alias Todolist.Catalog.WorkingTimes

    import Todolist.CatalogFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_workingtimes/0 returns all workingtimes" do
      working_times = working_times_fixture()
      assert Catalog.list_workingtimes() == [working_times]
    end

    test "get_working_times!/1 returns the working_times with given id" do
      working_times = working_times_fixture()
      assert Catalog.get_working_times!(working_times.id) == working_times
    end

    test "create_working_times/1 with valid data creates a working_times" do

      valid_attrs = %{end: ~N[2022-10-24 13:09:00], start: ~N[2022-10-24 13:09:00]}

      assert {:ok, %WorkingTimes{} = working_times} = Catalog.create_working_times(valid_attrs)
      assert working_times.end == ~N[2022-10-24 13:09:00]
      assert working_times.start == ~N[2022-10-24 13:09:00]
    end

    test "create_working_times/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_working_times(@invalid_attrs)
    end

    test "update_working_times/2 with valid data updates the working_times" do
      working_times = working_times_fixture()
      update_attrs = %{end: ~N[2022-10-25 13:09:00], start: ~N[2022-10-25 13:09:00]}

      assert {:ok, %WorkingTimes{} = working_times} = Catalog.update_working_times(working_times, update_attrs)
      assert working_times.end == ~N[2022-10-25 13:09:00]
      assert working_times.start == ~N[2022-10-25 13:09:00]
      update_attrs = %{end: ~N[2022-10-25 11:19:00], start: ~N[2022-10-25 11:19:00]}

      assert {:ok, %WorkingTimes{} = working_times} = Catalog.update_working_times(working_times, update_attrs)
      assert working_times.end == ~N[2022-10-25 11:19:00]
      assert working_times.start == ~N[2022-10-25 11:19:00]
    end

    test "update_working_times/2 with invalid data returns error changeset" do
      working_times = working_times_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_working_times(working_times, @invalid_attrs)
      assert working_times == Catalog.get_working_times!(working_times.id)
    end

    test "delete_working_times/1 deletes the working_times" do
      working_times = working_times_fixture()
      assert {:ok, %WorkingTimes{}} = Catalog.delete_working_times(working_times)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_working_times!(working_times.id) end
    end

    test "change_working_times/1 returns a working_times changeset" do
      working_times = working_times_fixture()
      assert %Ecto.Changeset{} = Catalog.change_working_times(working_times)
    end
  end

  describe "clocks" do
    alias Todolist.Catalog.Clocks

    import Todolist.CatalogFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clocks = clocks_fixture()
      assert Catalog.list_clocks() == [clocks]
    end

    test "get_clocks!/1 returns the clocks with given id" do
      clocks = clocks_fixture()
      assert Catalog.get_clocks!(clocks.id) == clocks
    end

    test "create_clocks/1 with valid data creates a clocks" do
      valid_attrs = %{status: true, time: ~N[2022-10-24 11:24:00]}

      assert {:ok, %Clocks{} = clocks} = Catalog.create_clocks(valid_attrs)
      assert clocks.status == true
      assert clocks.time == ~N[2022-10-24 11:24:00]
    end

    test "create_clocks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_clocks(@invalid_attrs)
    end

    test "update_clocks/2 with valid data updates the clocks" do
      clocks = clocks_fixture()
      update_attrs = %{status: false, time: ~N[2022-10-25 11:24:00]}

      assert {:ok, %Clocks{} = clocks} = Catalog.update_clocks(clocks, update_attrs)
      assert clocks.status == false
      assert clocks.time == ~N[2022-10-25 11:24:00]
    end

    test "update_clocks/2 with invalid data returns error changeset" do
      clocks = clocks_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_clocks(clocks, @invalid_attrs)
      assert clocks == Catalog.get_clocks!(clocks.id)
    end

    test "delete_clocks/1 deletes the clocks" do
      clocks = clocks_fixture()
      assert {:ok, %Clocks{}} = Catalog.delete_clocks(clocks)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_clocks!(clocks.id) end
    end

    test "change_clocks/1 returns a clocks changeset" do
      clocks = clocks_fixture()
      assert %Ecto.Changeset{} = Catalog.change_clocks(clocks)
    end
  end

  describe "workingtimes" do
    alias Todolist.Catalog.WorkingTimes

    import Todolist.CatalogFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_workingtimes/0 returns all workingtimes" do
      working_times = working_times_fixture()
      assert Catalog.list_workingtimes() == [working_times]
    end

    test "get_working_times!/1 returns the working_times with given id" do
      working_times = working_times_fixture()
      assert Catalog.get_working_times!(working_times.id) == working_times
    end

    test "create_working_times/1 with valid data creates a working_times" do
      valid_attrs = %{end: ~N[2022-10-24 13:21:00], start: ~N[2022-10-24 13:21:00]}

      assert {:ok, %WorkingTimes{} = working_times} = Catalog.create_working_times(valid_attrs)
      assert working_times.end == ~N[2022-10-24 13:21:00]
      assert working_times.start == ~N[2022-10-24 13:21:00]
    end

    test "create_working_times/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_working_times(@invalid_attrs)
    end

    test "update_working_times/2 with valid data updates the working_times" do
      working_times = working_times_fixture()
      update_attrs = %{end: ~N[2022-10-25 13:21:00], start: ~N[2022-10-25 13:21:00]}

      assert {:ok, %WorkingTimes{} = working_times} = Catalog.update_working_times(working_times, update_attrs)
      assert working_times.end == ~N[2022-10-25 13:21:00]
      assert working_times.start == ~N[2022-10-25 13:21:00]

    end

    test "update_working_times/2 with invalid data returns error changeset" do
      working_times = working_times_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_working_times(working_times, @invalid_attrs)
      assert working_times == Catalog.get_working_times!(working_times.id)
    end

    test "delete_working_times/1 deletes the working_times" do
      working_times = working_times_fixture()
      assert {:ok, %WorkingTimes{}} = Catalog.delete_working_times(working_times)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_working_times!(working_times.id) end
    end

    test "change_working_times/1 returns a working_times changeset" do
      working_times = working_times_fixture()
      assert %Ecto.Changeset{} = Catalog.change_working_times(working_times)
    end
  end
end
