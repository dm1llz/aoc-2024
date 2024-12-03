defmodule Day2Test do
  use ExUnit.Case
  doctest Aoc2024.Day2

  test "part 1 input is 2" do
    input = """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """

    assert Aoc2024.Day2.part1(input) == 2
  end

  test "part 1 input is 4" do
    input = """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """

    assert Aoc2024.Day2.part2(input) == 4
  end
end
