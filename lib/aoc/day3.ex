defmodule AOC.Day3 do
  def part1(moves) do
    {first_wire_path, second_wire_path} = moves |> List.to_tuple()

    MapSet.intersection(
      MapSet.new(process_path(first_wire_path)),
      MapSet.new(process_path(second_wire_path))
    )
    |> MapSet.delete({0, 0})
    |> Enum.min()
    |> Tuple.to_list()
    |> Enum.sum()
  end

  defp process_path(path) do
    path
    |> String.split(",")
    |> Enum.reduce([], fn move, acc ->
      action = String.split_at(move, 1)
      [action | acc]
    end)
    |> Enum.reverse()
    |> Enum.reduce([{0, 0}], fn {direction, steps}, coordinates ->
      steps = String.to_integer(steps)
      {prev_x, prev_y} = List.first(coordinates)

      coords =
        for n <- steps..1 do
          case direction do
            "R" ->
              {prev_x + n, prev_y}

            "L" ->
              {prev_x - n, prev_y}

            "U" ->
              {prev_x, prev_y + n}

            "D" ->
              {prev_x, prev_y - n}
          end
        end

      coords ++ coordinates
    end)
  end
end
