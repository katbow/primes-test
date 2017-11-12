defmodule Primes do
  @moduledoc """
  Documentation for Primes.
  """

  @prime_multipliers [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47,
  53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

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

  def remove_multiples(numbers_list, 24, multiplier) do
    prime = 97
    if prime * multiplier <= List.last(numbers_list) do
      numbers_list
      |> List.delete(prime * multiplier)
      |> remove_multiples(24, multiplier + 1)
    else
      numbers_list
    end
  end

  def remove_multiples(numbers_list, prime_position, multiplier) do
    prime = Enum.at(@prime_multipliers, prime_position)
    if prime * multiplier <= List.last(numbers_list) do
      numbers_list
      |> List.delete(prime * multiplier)
      |> remove_multiples(prime_position, multiplier + 1)
    else
      remove_multiples(numbers_list, prime_position + 1, 2)
    end
  end

  def make_row(primes_list, 1, _n) do
    "|  |" <> Enum.join(primes_list, " |") <> " |\n"
  end

  def make_row(primes_list, row_count, _n) do
    prime = Enum.at(primes_list, row_count - 2)
    primes_list = List.delete(primes_list, prime)
    "|#{prime} |#{Enum.map_join(primes_list, " |", &(&1 * prime))} |\n"
  end
end
