defmodule Aoc2024.Day1 do
  @moduledoc """
  Solution for Day 1 of Advent of Code
  """

  def part1(input) do
    [first_list, second_list] = build_lists(input)

    Enum.zip_reduce(Enum.sort(first_list, &<=/2), Enum.sort(second_list, &<=/2), 0, fn a,
                                                                                       b,
                                                                                       acc ->
      acc + abs(a - b)
    end)
  end

  def part2(input) do
    [first_list, second_list] = build_lists(input)

    Enum.reduce(first_list, 0, fn a, acc ->
      acc + a * Enum.count(second_list, &(&1 == a))
    end)
  end

  defp build_lists(input) do
    input
    |> String.split("\n")
    |> Enum.filter(fn line -> line != "" end)
    |> Enum.reduce([[], []], fn line, acc ->
      [first, second] =
        line
        |> String.split(" ")
        |> Enum.filter(&(&1 != ""))
        |> Enum.map(&String.to_integer/1)

      [Enum.concat(Enum.at(acc, 0), [first]), Enum.concat(Enum.at(acc, 1), [second])]
    end)
  end
end
