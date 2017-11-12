defmodule Primes do
  @moduledoc """
  Documentation for Primes.
  """

  def generate_primes_list(n) do
    n
    |> get_nth_prime_list()
  end

  @doc """
  Creates a list of primes from 2,
  which increments up to or greater than nth prime.
  """

  def get_nth_prime_list(n) do
    last_number = n * :math.log2(n) |> Float.ceil() |> trunc()
    Enum.to_list(2..last_number)
  end
end
