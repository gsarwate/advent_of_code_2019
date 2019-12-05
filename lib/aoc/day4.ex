defmodule AOC.Day4 do
  def part1(input), do: input |> process() |> Enum.count()

  def part2(input), do: input |> process() |> Enum.filter(&filter_duplicates/1) |> Enum.count()

  defp process(input) do
    {from, to} = input |> parse_input()
    from..to |> Enum.filter(&filter_input/1)
  end

  defp parse_input(input),
    do: input |> String.split("-") |> Enum.map(&String.to_integer/1) |> List.to_tuple()

  defp filter_input(password),
    do: password |> Integer.digits() |> check(_previous = 0, _repeats? = false, _ascending = true)

  defp filter_duplicates(password),
    do: password |> Integer.digits() |> check_duplicates(0, _dups = %{})

  defp check(_, _, _, _ascending = false), do: false
  defp check([], _previous, _repeats = true, _ascending = true), do: true
  defp check([], _previous, _repeats, _ascending), do: false

  defp check([current | rest], previous, _repeats? = false, _ascending?) do
    ascending? = check_ascending(current, previous)
    repeats? = check_repeat(current, previous)
    check(rest, current, repeats?, ascending?)
  end

  defp check([current | rest], previous, repeats? = true, _ascending) do
    ascending? = check_ascending(current, previous)
    check(rest, current, repeats?, ascending?)
  end

  defp check_ascending(current, previous), do: current >= previous

  defp check_repeat(current, previous), do: current == previous

  defp check_duplicates([], _previous, dups), do: Map.values(dups) |> Enum.member?(1)

  defp check_duplicates([current | rest], previous, dups) do
    dups =
      case check_repeat(current, previous) do
        true ->
          Map.update(dups, current, 1, &(&1 + 1))

        _ ->
          dups
      end

    check_duplicates(rest, current, dups)
  end
end
