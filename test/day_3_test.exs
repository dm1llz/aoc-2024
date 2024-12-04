defmodule Day3Test do
  use ExUnit.Case
  doctest Aoc2024.Day3

  test "part 1 input is 161" do
    input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

    assert Aoc2024.Day3.part1(input) == 161
  end

  test "part 2 input is 48" do
    input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

    assert Aoc2024.Day3.part2(input) == 48
  end
end
