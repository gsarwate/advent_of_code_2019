defmodule AOC.Day1 do
  def part1(file_stream) do
    file_stream
    |> Enum.reduce(0, fn n, acc -> acc + calculate_fuel(n) end)
  end

  def part2(file_stream) do
    file_stream
    |> Enum.reduce(0, fn n, acc -> acc + additional_fuel(n, 0) end)
  end

  defp calculate_fuel(n), do: div(n, 3) - 2

  defp additional_fuel(fuel, additional) when fuel < 6, do: additional

  defp additional_fuel(fuel, additional) do
    new_fuel = calculate_fuel(fuel)
    additional_fuel(new_fuel, additional + new_fuel)
  end
end
