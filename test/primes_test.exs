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

  test "get_nth_prime_list includes nth prime for n < 3" do
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
    actual2 = Primes.generate_primes_list(1000)
    assert Kernel.length(actual2) == 1000
    assert List.last(actual2) == 7919
  end

  test "generate_primes_list gives list of n prime numbers for large n" do
    actual = Primes.generate_primes_list(4000)
    assert Kernel.length(actual) == 4000
    assert List.last(actual) == 37813
  end

  test "make_rows creates first row in correct format" do
    actual = Primes.make_rows([2, 3, 5, 7], 4, [])
    expected = "|  |2 |3 |5 |7 |\n"
    assert List.first(actual) == expected
  end

  test "make_rows creates row containing prime number + multiples up to last in list" do
    actual = Primes.make_rows([2, 3, 5, 7], 4, [])
    expected = "|2 |4 |6 |10 |14 |\n"
    assert Enum.at(actual, 1) == expected
  end

  test "make_rows gives list of rows" do
    actual = Primes.make_rows([2, 3, 5, 7], 4, [])
    expected = ["|  |2 |3 |5 |7 |\n", "|2 |4 |6 |10 |14 |\n",
    "|3 |6 |9 |15 |21 |\n", "|5 |10 |15 |25 |35 |\n", "|7 |14 |21 |35 |49 |\n"]
    assert actual == expected
  end

  test "make_primes_mult_table generates string with all rows" do
    actual = Primes.make_primes_mult_table(4)
    expected = "|  |2 |3 |5 |7 |\n|2 |4 |6 |10 |14 |\n|3 |6 |9 |15 |21 |\n|5 |10 |15 |25 |35 |\n|7 |14 |21 |35 |49 |\n"
    assert actual == expected
  end
end
