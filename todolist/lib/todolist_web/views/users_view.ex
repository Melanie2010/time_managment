defmodule TodolistWeb.UsersView do
  use TodolistWeb, :view
  alias TodolistWeb.UsersView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UsersView, "users.json")}
  end

  def render("show.json", %{users: users}) do
    %{data: render_one(users, UsersView, "users.json")}
  end

  def render("users.json", %{users: users}) do
    %{
      id: users.id,
      username: users.username,
      email: users.email
    }
  end
end
