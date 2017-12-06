defmodule Table.CLI do
  alias Table.{Prime, Operation, Increment}
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
    table = table_type_decider(opts[:table])
    operation = operation_decider(opts[:operation])

    Table.make_table(n, table, operation)
  end

  defp table_type_decider(table) do
    case table do
      "primes" -> &Prime.generate_primes_list/1
      "increment" -> &Increment.make_list/1
      _ -> &Prime.generate_primes_list/1
    end
  end

  defp operation_decider(operation) do
    case operation do
      "multiply" -> &Operation.multiply/2
      "sum" -> &Operation.sum/2
      "subtract" -> &Operation.subtract/2
      "divide" -> &Operation.divide/2
      _ -> &Operation.multiply/2
    end
  end
end
