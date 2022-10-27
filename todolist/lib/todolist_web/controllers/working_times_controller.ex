defmodule TodolistWeb.WorkingTimesController do
  use TodolistWeb, :controller

  alias Todolist.Catalog
  alias Todolist.Catalog.WorkingTimes

  action_fallback TodolistWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Catalog.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"working_times" => working_times_params}) do
    with {:ok, %WorkingTimes{} = working_times} <- Catalog.create_working_times(working_times_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.working_times_path(conn, :show, working_times))
      |> render("show.json", working_times: working_times)
    end
  end

  def getEndandStartcreate(conn, %{"user_id" => user_id, "start" => start, "end" => ends }) do
    worktime = Catalog.getworktime(user_id, start, ends)
    render(conn, "show.json", worktime: worktime)
    end

  def show(conn, %{"id" => id}) do
    working_times = Catalog.get_working_times!(id)
    render(conn, "show.json", working_times: working_times)
  end

  def update(conn, %{"id" => id, "working_times" => working_times_params}) do
    working_times = Catalog.get_working_times!(id)

    with {:ok, %WorkingTimes{} = working_times} <- Catalog.update_working_times(working_times, working_times_params) do
      render(conn, "show.json", working_times: working_times)
    end
  end

  def delete(conn, %{"id" => id}) do
    working_times = Catalog.get_working_times!(id)

    with {:ok, %WorkingTimes{}} <- Catalog.delete_working_times(working_times) do
      send_resp(conn, :no_content, "")
    end
  end
end
