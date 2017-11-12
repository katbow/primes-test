defmodule Primes do
  @moduledoc """
  Documentation for Primes.
  """

  def generate_primes_list(n) do
    n
    |> get_nth_prime_list()
    |> remove_multiples_of_2(2)
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
  Removes multiples of 2 from list, for use with https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  """

  def remove_multiples_of_2(numbers_list, multiplier) do
    if 2 * multiplier <= List.last(numbers_list) do
      numbers_list
      |> List.delete(2 * multiplier)
      |> remove_multiples_of_2(multiplier + 1)
    else
      numbers_list
    end
  end
end
