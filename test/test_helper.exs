# Create the database, run migrations, and start the test transaction.
Mix.Task.run "ecto.create", ["--quiet"]
Mix.Task.run "ecto.migrate", ["--quiet"]
Ecto.Adapters.SQL.begin_test_transaction(Alixir.Repo)

defmodule Alixir.TestCase do
  use ExUnit.CaseTemplate

  using(opts) do
    quote do
      use ExSpec, unquote(opts)
    end
  end

  setup do
    Alixir.TestCase.with_test_transactions
  end

  def with_test_transactions do
    Ecto.Adapters.SQL.begin_test_transaction(Alixir.Repo)

    ExUnit.Callbacks.on_exit(fn ->
        Ecto.Adapters.SQL.rollback_test_transaction(Alixir.Repo)
    end)
  end
end

defmodule Alixir.ControllerTestCase do
  use ExUnit.CaseTemplate

  import Plug.Conn

  using(opts) do
    quote do
      use Alixir.TestCase, unquote(opts)
      use Plug.Test

      import Ecto.Query
      import Alixir.ControllerTestCase
    end
  end

  def send_request(conn) do
    conn
    |> put_private(:plug_skip_csrf_protection, true)
    |> Alixir.Endpoint.call([])
  end
end

ExUnit.start
