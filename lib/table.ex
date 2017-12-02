defmodule Table do
  alias Table.Prime
  alias Table.Operation
  def entry_point(n, opts \\ [table_data: "primes", operation: "multiply"]) do
    helper(n, opts[:table_data], opts[:operation])
  end

  # can use 2 opts, one for table data, and one for table_operation to determine in helper
  defp helper(n, table_data, operation) do
    list_creator = case table_data do
      "primes" ->
        &Prime.generate_primes_list/1
      _ ->
        &make_list/1
    end
    cell_calculation = case operation do
      "multiply" ->
        &Operation.mult/2
      _ ->
        &Operation.sum/2
    end
    make_primes_mult_table(n, list_creator, cell_calculation)
  end

  defp make_list(n) do
    Enum.to_list(1..n)
  end

  def make_primes_mult_table(n, data_fn, row_fn) do
    rows =
      n
      |> data_fn.()
      |> make_rows(n, [], row_fn)
    IO.puts Enum.join(rows)
  end

  def make_rows(primes_list, 0, acc, _row_fn) do
    ["|  |#{Enum.join(primes_list, " |")} |\n" | acc]
  end

  def make_rows(primes_list, row_count, acc, row_fn) do
    prime = Enum.at(primes_list, row_count - 1)
    rows = ["|#{prime} |#{Enum.map_join(primes_list, " |", &row_fn.(&1, prime))} |\n" | acc]
    make_rows(primes_list, row_count - 1, rows, row_fn)
  end
end
