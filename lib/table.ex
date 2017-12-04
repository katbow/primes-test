defmodule Table do
  def make_list(n) do
    Enum.to_list(1..n)
  end

  def make_table(n, data_fn, row_fn) do
    n
    |> data_fn.()
    |> make_rows(n, [], row_fn)
    |> Enum.join()
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
