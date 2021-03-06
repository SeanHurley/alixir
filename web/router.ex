defmodule Alixir.Router do
  use Alixir.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/alixir", Alixir do
    pipe_through :browser # Use the default browser stack
    get "/", TaskController, :index

    resources "/tasks", TaskController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Alixir do
  #   pipe_through :api
  # end
end
