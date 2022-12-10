require IEx

defmodule AOC.Day01 do
  def part1(data) do
    data
    |> parse_data
    |> Enum.map(&Enum.sum/1)
    |> Enum.max()
  end

  def part2(data) do
    data
    |> parse_data
    |> Enum.map(&Enum.sum/1)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  def parse_data(data) do
    data
    |> String.split("\n")
    |> Enum.chunk_by(fn x -> x == "" end)
    |> Enum.reject(fn x -> x == [""] end)
    |> Enum.map(fn x -> x |> Enum.map(&String.to_integer/1) end)
  end
end
