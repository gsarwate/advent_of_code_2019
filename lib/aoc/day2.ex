defmodule AOC.Day2 do
  def part1(numbers) do
    {answer, _} = reset(numbers, 12, 2) |> do_work()

    Map.get(answer, 0)
  end

  def part2(numbers) do
    {noun, verb} =
      for noun <- 0..99, verb <- 0..99 do
        {noun, verb}
      end
      |> Enum.find(fn {noun, verb} ->
        numbers
        |> reset(noun, verb)
        |> do_work()
        |> verify()
      end)

    100 * noun + verb
  end

  defp reset(numbers, noun, verb), do: Map.merge(numbers, %{1 => noun, 2 => verb})

  defp do_work(numbers) do
    numbers
    |> Enum.reduce_while({numbers, 0}, fn _elem, {acc, current_index} ->
      value1_index = acc[current_index + 1]
      value2_index = acc[current_index + 2]
      update_index = acc[current_index + 3]

      case acc[current_index] do
        1 ->
          {:cont,
           {Map.update!(acc, update_index, fn _value ->
              acc[value1_index] + acc[value2_index]
            end), current_index + 4}}

        2 ->
          {:cont,
           {Map.update!(acc, update_index, fn _value ->
              acc[value1_index] * acc[value2_index]
            end), current_index + 4}}

        99 ->
          {:halt, {acc, current_index}}
      end
    end)
  end

  defp verify({answer, _}), do: Map.get(answer, 0) == 19_690_720
end
