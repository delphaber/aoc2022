require IEx

defmodule AOC.Day03.Part1 do
  def solve(data) do
    data
    |> Enum.map(&split_rucksack/1)
    |> Enum.map(&find_common_items/1)
    |> Enum.map(&List.first/1)
    |> Enum.map(&calculate_priority/1)
    |> Enum.sum()
  end

  def split_rucksack(rucksack) do
    size = String.length(rucksack)
    String.split_at(rucksack, div(size, 2))
  end

  def find_common_items({space1, space2}) do
    space1_set = MapSet.new(String.to_charlist(space1))
    space2_set = MapSet.new(String.to_charlist(space2))

    MapSet.intersection(space1_set, space2_set)
    |> MapSet.to_list()
  end

  def calculate_priority(item) when item in ?a..?z do
    item - 96
  end

  def calculate_priority(item) when item in ?A..?Z do
    item - 38
  end
end

defmodule AOC.Day03.Part2 do
  def solve(data) do
    data
    |> Enum.chunk_every(3)
    |> Enum.map(&find_badge/1)
    |> Enum.map(&calculate_priority/1)
    |> Enum.sum()
  end

  def find_badge(rucksacks) do
    rucksacks
    |> Enum.map(&String.to_charlist/1)
    |> Enum.map(&MapSet.new/1)
    |> Enum.reduce(fn x, acc -> MapSet.intersection(acc, x) end)
    |> MapSet.to_list()
    |> List.first()
  end

  def calculate_priority(item) when item in ?a..?z do
    item - 96
  end

  def calculate_priority(item) when item in ?A..?Z do
    item - 38
  end
end
