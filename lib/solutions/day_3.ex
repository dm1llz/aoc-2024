defmodule Aoc2024.Day3 do
  def part1(input) do
    find_mul(input)
  end

  def part2(input) do
    input
    |> String.split("do")
    |> Enum.map(&find_dos/1)
    |> Enum.filter(& &1)
    |> Enum.map(&find_mul/1)
    |> Enum.sum()

  end

  defp find_mul(input) do
    input
    |> String.split("mul(")
    |> Enum.drop(1)
    |> parse_mul()
    |> Enum.filter(& &1)
    |> Enum.map(fn {x, y} -> x * y end)
    |> Enum.sum()
  end

  defp parse_mul([]), do: []
  defp parse_mul([first | rest]) do
    case String.split(first, ")", parts: 2) do
      [nums, _] -> case String.split(nums, ",") do
        [x, y] -> [parse_numbers(x, y) | parse_mul(rest)]
        _ -> [nil | parse_mul(rest)]
      end
      _ -> [nil | parse_mul(rest)]
    end
  end

  defp parse_numbers(x, y) do
    with {x_int, ""} <- Integer.parse(String.trim(x)),
         {y_int, ""} <- Integer.parse(String.trim(y)),
         true <- valid_number?(x_int) and valid_number?(y_int) do
      {x_int, y_int}
    else
      _ -> nil
    end
  end

  defp valid_number?(num), do: num >= 0 and num <= 999

  defp find_dos(step) do
    if String.starts_with?(step, "n't()") do
      nil
    else
      step
    end
  end
end
