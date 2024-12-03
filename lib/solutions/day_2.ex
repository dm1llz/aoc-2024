defmodule Aoc2024.Day2 do
  def part1(input) do
    get_nums(input)
    |> Enum.map(&is_safe(&1, 0))
    |> Enum.reduce(0, fn is_safe, acc -> if is_safe, do: acc + 1, else: acc end)
  end

  def part2(input) do
    get_nums(input)
    |> Enum.map(&is_safe(&1, 1))
    |> Enum.reduce(0, fn is_safe, acc -> if is_safe, do: acc + 1, else: acc end)
  end

  defp get_nums(input) do
    input
    |> String.split("\n")
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(&String.split/1)
    |> Enum.map(fn nums -> Enum.map(nums, &String.to_integer/1) end)
  end

  defp is_safe(nums, threshold) do
    is_increasing = Enum.at(nums, 0) < Enum.at(nums, 1)
    is_safe(nums, threshold, is_increasing)
  end

  defp is_safe([], _, _), do: true
  defp is_safe([_], _, _), do: true

  defp is_safe([a, b | rest], threshold, is_increasing) do
    res = compare(a, b, is_increasing)

    if res do
      is_safe([b | rest], threshold, is_increasing)
    else
      if threshold > 0 do
        next = Enum.at(rest, 0)
        res = compare(b, next, is_increasing)
        IO.inspect(res)
        if res do
          is_safe([b | rest], threshold - 1, is_increasing)
        else
          if compare(a, next, is_increasing) do
            is_safe([a | rest], threshold - 1, is_increasing)
          else
            false
          end
        end
      end
    end
  end

  defp compare(a, b, is_increasing) do
    if is_increasing do
      a < b && b - a <= 3
    else
      a > b && a - b <= 3
    end
  end
end
