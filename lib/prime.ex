defmodule Table.Prime do
  @moduledoc """
  Documentation for Primes.
  """

  @doc """
  Creates a list which is of length n, with the last number as the nth prime
  """

  def generate_primes_list(n) do
    sqrt_n = calculate_sqrt(n)
    n
    |> get_last_value()
    |> make_list()
    |> remove_multiples(0, 2, sqrt_n)
    |> Enum.take(n)
  end

  defp calculate_sqrt(n) do
    n |> :math.sqrt() |> Float.ceil() |> trunc()
  end

  defp get_last_value(1) do
    2
  end

  defp get_last_value(2) do
    3
  end

  defp get_last_value(n) do
    n * :math.log2(n) |> Float.ceil() |> trunc()
  end

  @doc """
  Creates a list of primes from 2,
  which increments up to or greater than nth prime.
  """

  def make_list(n) do
    Enum.to_list(2..n)
  end

  defp remove_multiples(numbers_list, prime_position, _multiplier, sqrt_n) when prime_position >= sqrt_n do
    numbers_list
  end

  defp remove_multiples(numbers_list, prime_position, multiplier, sqrt_n) do
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
