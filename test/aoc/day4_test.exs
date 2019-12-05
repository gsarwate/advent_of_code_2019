defmodule AOC.Day4Test do
  use ExUnit.Case

  alias AOC.Day4

  test "solution day 4 part 1" do
    assert Day4.part1("134792-675810") == 1955
  end

  test "solution day 4 part 2" do
    assert Day4.part2("134792-675810") == 1319
  end
end
