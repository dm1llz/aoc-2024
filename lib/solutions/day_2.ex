defmodule Aoc2024.Day2 do
  def part1(input) do
    get_nums(input)
    |> Enum.map(&is_safe(&1, false))
    |> Enum.reduce(0, fn is_safe, acc -> if is_safe, do: acc + 1, else: acc end)
  end

  def part2(input) do
    get_nums(input)
    |> Enum.map(&is_safe(&1, true))
    |> Enum.reduce(0, fn is_safe, acc -> if is_safe, do: acc + 1, else: acc end)
  end

  defp get_nums(input) do
    input
    |> String.split("\n")
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(&String.split/1)
    |> Enum.map(fn nums -> Enum.map(nums, &String.to_integer/1) end)
  end

  defp is_safe(nums, dampen) do
    if valid_report?(nums) do
      true
    else
      if dampen do
        nums
        |> Stream.with_index()
        |> Stream.map(fn {_, i} -> List.delete_at(nums, i) end)
        |> Enum.find(&valid_report?/1)
      else
        false
      end
    end
  end

  def valid_report?(report) do
    all_increasing?(report) or all_decreasing?(report)
  end

  defp all_increasing?([_]), do: true
  defp all_increasing?([a, b | rest]) when b - a <= 3 and b > a do
    all_increasing?([b | rest])
  end
  defp all_increasing?(_), do: false

  defp all_decreasing?([_]), do: true
  defp all_decreasing?([a, b | rest]) when a - b <= 3 and a > b do
    all_decreasing?([b | rest])
  end
  defp all_decreasing?(_), do: false
end
