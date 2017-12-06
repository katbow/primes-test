defmodule Table.OperationTest do
  use ExUnit.Case
  alias Table.Operation
  test "multiply/2 returns product of x * y" do
    assert Operation.multiply(10, 2) == 20
  end

  test "sum/2 returns sum of x + y" do
    assert Operation.sum(10, 2) == 12
  end

  test "subtract/2 returns difference between x - y" do
    assert Operation.subtract(10, 2) == 8
  end

  test "divide/2 returns quotient of x / y" do
    assert Operation.divide(10, 2) == 5
  end
end
