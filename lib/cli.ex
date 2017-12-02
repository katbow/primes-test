defmodule Table.CLI do
  def main(n, args \\ [table: "primes", operation: "multiply"]) do
    args
    |> parse_args()
    |> response(n)
  end

  defp parse_args(args) do
    {opts, type, _} =
      args
      |> OptionParser.parse(switches: [table: :string, operation: :string])
    {opts, List.to_string(type)}
  end

  defp response(n, {opts, type}) do
  end
end
