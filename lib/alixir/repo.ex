defmodule Alixir.Repo do
  use Ecto.Repo, otp_app: :alixir
  use Scrivener, page_size: 10
end
