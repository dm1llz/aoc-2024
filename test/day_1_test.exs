defmodule Day1Test do
  use ExUnit.Case
  doctest Aoc2024.Day1

  test "part 1 input is 11" do
    input = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """

    assert Aoc2024.Day1.part1(input) == 11
  end

  test "part 1 input is 31" do
    input = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """

    assert Aoc2024.Day1.part2(input) == 31
  end
end
