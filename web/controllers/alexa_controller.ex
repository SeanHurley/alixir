defmodule Alixir.AlexaController do
  use Alixir.Web, :controller
  require Logger

  alias Alixir.Alexa

  # plug :scrub_params, "alexa" when action in [:create, :update]
  plug :action

  # def index(conn, _params) do
  #   alexa = Repo.all(Alexa)
  #   render(conn, "index.json", alexa: alexa)
  # end
  #
  # def create(conn, %{"alexa" => alexa_params}) do
  #   changeset = Alexa.changeset(%Alexa{}, alexa_params)
  #
  #   if changeset.valid? do
  #     alexa = Repo.insert(changeset)
  #     render(conn, "show.json", alexa: alexa)
  #   else
  #     conn
  #     |> put_status(:unprocessable_entity)
  #     |> render(Alixir.ChangesetView, "error.json", changeset: changeset)
  #   end
  # end
  #
  # def show(conn, %{"id" => id}) do
  #   alexa = Repo.get(Alexa, id)
  #   render conn, "show.json", alexa: alexa
  # end
  #
  # def update(conn, %{"id" => id, "alexa" => alexa_params}) do
  #   alexa = Repo.get(Alexa, id)
  #   changeset = Alexa.changeset(alexa, alexa_params)
  #
  #   if changeset.valid? do
  #     alexa = Repo.update(changeset)
  #     render(conn, "show.json", alexa: alexa)
  #   else
  #     conn
  #     |> put_status(:unprocessable_entity)
  #     |> render(Alixir.ChangesetView, "error.json", changeset: changeset)
  #   end
  # end
  #
  # def delete(conn, %{"id" => id}) do
  #   alexa = Repo.get(Alexa, id)
  #
  #   alexa = Repo.delete(alexa)
  #   render(conn, "show.json", alexa: alexa)
  # end

  def action(conn, params) do
    Logger.debug("TEST")
    Logger.debug(params)
    render(conn, "show.json", alexa: {})
  end
end
