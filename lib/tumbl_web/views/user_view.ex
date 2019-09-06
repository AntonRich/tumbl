defmodule TumblWeb.UserView do
  use TumblWeb, :view

  alias Tumbl.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end