defmodule PrimesTest do
  use ExUnit.Case

  test "get_nth_prime_list creates list incrementing by 1" do
    assert Primes.get_nth_prime_list(4) == [2, 3, 4, 5, 6, 7, 8]
    assert Primes.get_nth_prime_list(3) == [2, 3, 4, 5]
  end

  test "get_nth_prime_list includes nth prime" do
    actual = Primes.get_nth_prime_list(168)
    expected_length = 1241
    nth_prime = 997
    assert Kernel.length(actual) == expected_length
    assert List.last(actual) >= nth_prime
  end

  test "get_nth_prime_list includes nth prime for numbers" do
    assert Primes.get_nth_prime_list(1) == [2, 3]
    assert Primes.get_nth_prime_list(2) == [2, 3]
  end

  test "remove_multiples removes multiples of first 4 primes" do
    assert Primes.remove_multiples([2, 3, 4, 5, 6, 7, 8], 0, 2) == [2, 3, 5, 7]
    actual = Primes.remove_multiples(Enum.to_list(2..21), 0, 2)
    expected = [2, 3, 5, 7, 11, 13, 17, 19]
    assert actual == expected
  end

  test "generate_primes_list gives list of n prime numbers for small n" do
    actual = Primes.generate_primes_list(10)
    assert Kernel.length(actual) == 10
    assert List.last(actual) == 29
  end

  test "generate_primes_list gives list of n prime numbers for med n" do
    actual = Primes.generate_primes_list(168)
    assert Kernel.length(actual) == 168
    assert List.last(actual) == 997
    actual = Primes.generate_primes_list(1000)
    assert Kernel.length(actual) == 1000
    assert List.last(actual) == 7919
  end

  test "make_row creates first row in correct format" do
    actual = Primes.make_row([2, 3, 5, 7], 1, 4)
    expected = "|  |2 |3 |5 |7 |\n"
    assert actual == expected
  end

  test "make_row creates row containing prime number + multiples up to last in list" do
    actual = Primes.make_row([2, 3, 5, 7], 2, 4)
    expected = "|2 |6 |10 |14 |\n"
    assert actual == expected
  end
end
