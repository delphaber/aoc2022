require IEx

defmodule AOC.Day01.Part1 do
  def solve(data) do
    data
    |> parse_data
    |> Enum.map(&Enum.sum/1)
    |> Enum.max()
  end

  def parse_data(data) do
    data
    |> Enum.chunk_by(fn x -> x == "" end)
    |> Enum.reject(fn x -> x == [""] end)
    |> Enum.map(fn x -> x |> Enum.map(&String.to_integer/1) end)
  end
end

defmodule AOC.Day01.Part2 do
  def solve(data) do
    data
    |> parse_data
    |> Enum.map(&Enum.sum/1)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  def parse_data(data) do
    data
    |> Enum.chunk_by(fn x -> x == "" end)
    |> Enum.reject(fn x -> x == [""] end)
    |> Enum.map(fn x -> x |> Enum.map(&String.to_integer/1) end)
  end
end
