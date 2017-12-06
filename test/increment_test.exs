defmodule Table.IncrementTest do
  alias Table.Increment
  use ExUnit.Case

  test "Increment.make_list makes an incremental list from 1 to n" do
    assert Increment.make_list(5) == [1, 2, 3, 4, 5]
  end
end
