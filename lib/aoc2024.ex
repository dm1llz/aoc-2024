defmodule Aoc2024 do
  alias Aoc2024.Day2

  def run(day) do
    input = File.read!("input/day#{day}.txt")

    IO.inspect(Day2.part2(input))
  end
end

Aoc2024.run(2)
