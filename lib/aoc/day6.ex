defmodule AOC.Day6 do
  def part1(input) do
    {_, _, count} =
      input
      |> input_map()
      |> process_input_map()

    count
  end

  defp input_map(input) do
    input
    |> Enum.reduce(%{}, fn [k | v], acc ->
      Map.update(acc, k, v, fn val -> val ++ v end)
    end)
  end

  defp process_input_map(in_map) do
    in_map
    |> Enum.reduce_while(
      {_current_objects = ["COM"], _current_position = 1, _count = 0},
      fn _e, {current_objects, current_position, count} ->
        current_objects =
          Enum.reduce(current_objects, [], fn k, acc ->
            if Map.has_key?(in_map, k) do
              Map.fetch!(in_map, k) ++ acc
            else
              acc
            end
          end)

        if length(current_objects) > 0 do
          {:cont,
           {current_objects, current_position + 1,
            count + length(current_objects) * current_position}}
        else
          {:halt, {current_objects, current_position, count}}
        end
      end
    )
  end
end
