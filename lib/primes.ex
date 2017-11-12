defmodule Primes do
  @moduledoc """
  Documentation for Primes.
  """

  def make_primes_mult_table(n) do
    rows =
      n
      |> generate_primes_list()
      |> make_rows(n, [])
    Enum.join(rows)
  end

  def generate_primes_list(n) do
    n
    |> get_nth_prime_list()
    |> remove_multiples(0, 2)
    |> Enum.take(n)
  end

  @doc """
  Creates a list of primes from 2,
  which increments up to or greater than nth prime.
  """

  def get_nth_prime_list(n) when n < 3 do
    [2, 3]
  end

  def get_nth_prime_list(n) do
    last_number = n * :math.log2(n) |> Float.ceil() |> trunc()
    Enum.to_list(2..last_number)
  end

  @doc """
  Removes multiples of prime numbers from list, for use with https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  """

  def remove_multiples(numbers_list, prime_position, multiplier) do
    prime = Enum.at(numbers_list, prime_position)
    cond do
      prime == nil ->
        numbers_list
      prime * multiplier <= List.last(numbers_list) ->
        numbers_list
        |> List.delete(prime * multiplier)
        |> remove_multiples(prime_position, multiplier + 1)
      true ->
        remove_multiples(numbers_list, prime_position + 1, 2)
    end
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
