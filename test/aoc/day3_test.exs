defmodule AOC.Day3Test do
  use ExUnit.Case

  alias AOC.Day3

  test "solution day 3 part 1" do
    input = ["R8,U5,L5,D3", "U7,R6,D4,L4"]
    assert Day3.part1(input) == 6

    input = read_input("test/input/day3_input")
    assert Day3.part1(input) == 2129
  end

  defp read_input(input) do
    input
    |> File.stream!([], :line)
    |> Enum.map(fn line -> String.trim(line) end)
  end
end
