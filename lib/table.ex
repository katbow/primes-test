defmodule Table do
  def make_primes_mult_table(n) do
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
