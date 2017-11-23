defmodule Table do
  def entry_point(n, opts \\ [table_data: "primes"]) do
    helper(n, opts[:table_data])
  end

  # can use 2 opts, one for table data, and one for table_operation to determine in helper
  defp helper(n, table_data) do
    case table_data do
      "primes" ->
        make_primes_mult_table(n, &Primes.generate_primes_list/1, &row_mult/2)
      _ ->
        make_primes_mult_table(n, &make_list/1, &row_sum/2)
    end
  end
    rows =
      n
      |> Primes.generate_primes_list()
      |> make_rows(n, [])
    IO.puts Enum.join(rows)
  end

  def make_rows(primes_list, 0, acc) do
    ["|  |#{Enum.join(primes_list, " |")} |\n" | acc]
  end

  def make_rows(primes_list, row_count, acc) do
    prime = Enum.at(primes_list, row_count - 1)
    rows = ["|#{prime} |#{Enum.map_join(primes_list, " |", &(&1 * prime))} |\n" | acc]
    make_rows(primes_list, row_count - 1, rows)
  end
end
