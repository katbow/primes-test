defmodule Primes do
  @moduledoc """
  Documentation for Primes.
  """

  def generate_primes_list(n) do
    sqrt_n = calculcate_sqrt(n)
    n
    |> get_nth_prime_list()
    |> remove_multiples(0, 2, sqrt_n)
    |> Enum.take(n)
  end

  defp calculcate_sqrt(n) do
    n |> :math.sqrt() |> Float.ceil() |> trunc()
  end

  @doc """
  Creates a list of primes from 2,
  which increments up to or greater than nth prime.
  """

  def get_nth_prime_list(n) when n < 3 do
    [2, 3]
  end

  def get_nth_prime_list(n) do
    last_number = get_last_value(n)
    Enum.to_list(2..last_number)
  end


  defp get_last_value(n) do
    n * :math.log2(n) |> Float.ceil() |> trunc()
  end

  @doc """
  Removes multiples of prime numbers from list, for use with https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  """

  def remove_multiples(numbers_list, prime_position, _multiplier, sqrt_n) when prime_position > sqrt_n do
    numbers_list
  end

  def remove_multiples(numbers_list, prime_position, multiplier, sqrt_n) do
    prime = Enum.at(numbers_list, prime_position)
    cond do
      prime * multiplier <= List.last(numbers_list) ->
        numbers_list
        |> List.delete(prime * multiplier)
        |> remove_multiples(prime_position, multiplier + 1, sqrt_n)
      true ->
        prime_pos = prime_position + 1
        remove_multiples(numbers_list, prime_pos, Enum.at(numbers_list, prime_pos), sqrt_n)
    end
  end
end
