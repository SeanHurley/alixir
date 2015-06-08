defmodule Alixir.AlexaControllerTest do
  use Alixir.ConnCase

  alias Alixir.Alexa
  @valid_params alexa: %{}
  @invalid_params alexa: %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "GET /alexa", %{conn: conn} do
    conn = get conn, alexa_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "GET /alexa/:id", %{conn: conn} do
    alexa = Repo.insert %Alexa{}
    conn = get conn, alexa_path(conn, :show, alexa)
    assert json_response(conn, 200)["data"] == %{
      "id" => alexa.id
    }
  end

  test "POST /alexa with valid data", %{conn: conn} do
    conn = post conn, alexa_path(conn, :create), @valid_params
    assert json_response(conn, 200)["data"]["id"]
  end

  test "POST /alexa with invalid data", %{conn: conn} do
    conn = post conn, alexa_path(conn, :create), @invalid_params
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "PUT /alexa/:id with valid data", %{conn: conn} do
    alexa = Repo.insert %Alexa{}
    conn = put conn, alexa_path(conn, :update, alexa), @valid_params
    assert json_response(conn, 200)["data"]["id"]
  end

  test "PUT /alexa/:id with invalid data", %{conn: conn} do
    alexa = Repo.insert %Alexa{}
    conn = put conn, alexa_path(conn, :update, alexa), @invalid_params
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "DELETE /alexa/:id", %{conn: conn} do
    alexa = Repo.insert %Alexa{}
    conn = delete conn, alexa_path(conn, :delete, alexa)
    assert json_response(conn, 200)["data"]["id"]
    refute Repo.get(Alexa, alexa.id)
  end
end
