defmodule TableTest do
  alias Table.{Operation, Prime}
  use ExUnit.Case
  
  test "make_rows creates first row in correct format" do
    actual = Table.make_rows([2, 3, 5, 7], 4, [], &Operation.mult/2)
    expected = "|  |2 |3 |5 |7 |\n"
    assert List.first(actual) == expected
  end

  test "make_rows creates row containing prime number + multiples up to last in list" do
    actual = Table.make_rows([2, 3, 5, 7], 4, [], &Operation.mult/2)
    expected = "|2 |4 |6 |10 |14 |\n"
    assert Enum.at(actual, 1) == expected
  end

  test "make_rows gives list of rows" do
    actual = Table.make_rows([2, 3, 5, 7], 4, [], &Operation.mult/2)
    expected = ["|  |2 |3 |5 |7 |\n", "|2 |4 |6 |10 |14 |\n",
    "|3 |6 |9 |15 |21 |\n", "|5 |10 |15 |25 |35 |\n", "|7 |14 |21 |35 |49 |\n"]
    assert actual == expected
  end

  test "make_table generates string with all rows" do
    actual = Table.make_table(4, &Prime.generate_primes_list/1, &Operation.mult/2)
    expected = "|  |2 |3 |5 |7 |\n|2 |4 |6 |10 |14 |\n|3 |6 |9 |15 |21 |\n|5 |10 |15 |25 |35 |\n|7 |14 |21 |35 |49 |\n"
    assert actual == expected
  end
end
