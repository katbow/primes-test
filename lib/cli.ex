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

  defp response(n, {opts, type}) do
  end
end
