defmodule TodolistWeb.UsersController do
  use TodolistWeb, :controller

  alias Todolist.Accounts
  alias Todolist.Accounts.Users

  action_fallback TodolistWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"users" => users_params}) do
    with {:ok, %Users{} = users} <- Accounts.create_users(users_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.users_path(conn, :show, users))
      |> render("show.json", users: users)
    end
  end

  def show(conn, %{"id" => id}) do
    users = Accounts.get_users!(id)
    render(conn, "show.json", users: users)
  end

  def update(conn, %{"id" => id, "users" => users_params}) do
    users = Accounts.get_users!(id)

    with {:ok, %Users{} = users} <- Accounts.update_users(users, users_params) do
      render(conn, "show.json", users: users)
    end
  end

  def recherche(conn, %{"email" => email, "username" => username}) do
    users = Accounts.list_users()
    for user <- users do
      if user.email == email and user.username == username do
        render(conn, "show.json", users: user)
    end
  end
end

  def delete(conn, %{"id" => id}) do
    users = Accounts.get_users!(id)

    with {:ok, %Users{}} <- Accounts.delete_users(users) do
      send_resp(conn, :no_content, "")
    end
  end
end
