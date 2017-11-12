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

  test "remove_multiples_of_2 removes all even numbers except 2" do
    assert Primes.remove_multiples_of_2([2, 3, 4, 5], 2) == [2, 3, 5]
    assert Primes.remove_multiples_of_2([2, 3, 4, 5, 6, 7, 8], 2) == [2, 3, 5, 7]
  end
end
