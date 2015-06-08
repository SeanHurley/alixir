defmodule Alixir.AlexaView do
  use Alixir.Web, :view

  def render("index.json", %{alexa: alexa}) do
    %{data: render_many(alexa, "alexa.json")}
  end

  def render("show.json", %{alexa: alexa}) do
    %{foo: "bar"}
  end

  def render("alexa.json", %{alexa: alexa}) do
    %{id: alexa.id}
  end
end
