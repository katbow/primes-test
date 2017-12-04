defmodule Table.CLI do
  alias Table.{Prime, Operation}
  def main(args \\ []) do
    args
    |> parse_args()
    |> response()
    |> IO.inspect()
  end

  defp parse_args(args) do
    {opts, [n|_], _} =
      args
      |> OptionParser.parse(switches: [table: :string, operation: :string])
    {opts, String.to_integer(n)}
  end

  defp response({opts, n}) do
    table = case opts[:table] do
      "primes" -> &Prime.generate_primes_list/1
      "increment" -> &Table.make_list/1
      _ -> &Prime.generate_primes_list/1
    end
    operation = case opts[:operation] do
      "multiply" -> &Operation.mult/2
      "sum" -> &Operation.sum/2
      _ -> &Operation.mult/2
    end
    Table.make_table(n, table, operation)
  end
end
