require IEx

defmodule AOC.Day04.Part1 do
  def solve(data) do
    data
    |> Enum.map(fn x ->
      String.split(x, ",")
      |> Enum.map(fn y ->
        [first, last] = String.split(y, "-")
        Range.new(String.to_integer(first), String.to_integer(last))
      end)
    end)
    |> Enum.filter(&fully_overlapped?/1)
    |> Enum.count()
  end

  def fully_overlapped?([elf1, elf2]) do
    (elf2.first >= elf1.first && elf2.last <= elf1.last) ||
      (elf1.first >= elf2.first && elf1.last <= elf2.last)
  end
end

defmodule AOC.Day04.Part2 do
  def solve(data) do
    data
    |> Enum.map(fn x ->
      String.split(x, ",")
      |> Enum.map(fn y ->
        [first, last] = String.split(y, "-")
        Range.new(String.to_integer(first), String.to_integer(last))
      end)
    end)
    |> Enum.filter(&any_overlaps?/1)
    |> Enum.count()
  end

  def any_overlaps?([elf1, elf2]) do
    !Range.disjoint?(elf1, elf2)
  end
end
