defmodule MenuMonkey.Router do
  use MenuMonkey.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug MenuMonkey.Auth, repo: MenuMonkey.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MenuMonkey do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", MenuMonkey do
  #   pipe_through :api
  # end
end
