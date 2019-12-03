defmodule AOC.Day2Test do
  use ExUnit.Case

  alias AOC.Day2

  test "solution day 2 part 1" do
    input = read_input("test/input/day2_input")
    assert Day2.part1(input) == 4_714_701
  end

  test "solution day 2 part 2" do
    input = read_input("test/input/day2_input")
    assert Day2.part2(input) == 5121
  end

  defp read_input(file) do
    file
    |> File.read!()
    |> String.split(",", trim: true)
    |> Stream.with_index()
    |> Stream.map(fn {value, index} -> {index, String.to_integer(value)} end)
    |> Map.new()
  end
end
