defmodule TumblWeb.SessionController do
  use TumblWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(
    conn,
    %{"session" => %{"username" => username, "password" => pass}}
  ) do
    case Tumbl.Accounts.authenticate_by_username_and_pass(username, pass) do
      {:ok, user} ->
        conn
        |> TumblWeb.Auth.login(user)
        |> put_flash(:info, "Welcome Back!")
        |> redirect(to: Routes.page_path(conn, :index))
      
      {:error, _reason} ->
        conn
        |> put_flash(:info, "Invalid username/password combination") 
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> TumblWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end

end