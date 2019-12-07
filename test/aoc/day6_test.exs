defmodule AOC.Day6Test do
  use ExUnit.Case

  alias AOC.Day6

  test "solution day 6 part 1 example" do
    input = parse_input("test/input/day6_example")
    assert Day6.part1(input) == 42
  end

  test "solution day 6 part 1" do
    input = parse_input("test/input/day6_input")
    assert Day6.part1(input) == 119831
  end

  test "Solution day 6 part 2 example" do
    input = parse_input("test/input/day6_example_pt2")
    assert Day6.part2(input) == 4
  end

  test "Solution day 6 part 2" do
    input = parse_input("test/input/day6_input")
    assert Day6.part2(input) == 322
  end

  defp parse_input(path) do
    path
    |> File.stream!([], :line)
    |> Enum.map(fn line ->
      line
      |> String.trim()
      |> String.split(")")
    end)
  end
end
