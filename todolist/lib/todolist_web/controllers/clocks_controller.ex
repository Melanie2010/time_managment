defmodule TodolistWeb.ClocksController do
  use TodolistWeb, :controller

  alias Todolist.Catalog
  alias Todolist.Catalog.Clocks


  action_fallback TodolistWeb.FallbackController

  def index(conn, _params) do

    clocks = Catalog.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"clocks" => clocks_params}) do
    with {:ok, %Clocks{} = clocks} <- Catalog.create_clocks(clocks_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clocks_path(conn, :show, clocks))
      |> render("show.json", clocks: clocks)
    end
  end

  def show(conn, %{"id" => id}) do

    clocks = Catalog.get_clocks!(id)
    render(conn, "show.json", clocks: clocks)
  end

  def update(conn, %{"id" => id, "clocks" => clocks_params}) do
    clocks = Catalog.get_clocks!(id)

    with {:ok, %Clocks{} = clocks} <- Catalog.update_clocks(clocks, clocks_params) do
      render(conn, "show.json", clocks: clocks)
    end
  end

  def delete(conn, %{"id" => id}) do
    clocks = Catalog.get_clocks!(id)

    with {:ok, %Clocks{}} <- Catalog.delete_clocks(clocks) do
      send_resp(conn, :no_content, "")
    end
  end
end
