defmodule Day1Test do
  use ExUnit.Case

  alias AOC.Day1

  test "solution day 1 part 1" do
    input = read_input("test/input/day1_input")
    assert Day1.part1(input) == 3_152_919
  end

  test "solution day 1 part 2" do
    input = read_input("test/input/day1_input")
    assert Day1.part2(input) == 4_726_527
  end

  defp read_input(file) do
    file
    |> File.stream!([], :line)
    |> Stream.map(fn line ->
      {integer, _leftover} = Integer.parse(line)
      integer
    end)
  end
end
