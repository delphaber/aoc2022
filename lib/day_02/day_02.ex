require IEx

defmodule AOC.Day02.Part1 do
  def solve(data) do
    data
    |> parse_data
    |> Enum.map(fn x ->
      [opponent_choice, my_choice] = String.split(x)
      total_round_score(opponent_choice, my_choice)
    end)
    |> Enum.sum()
  end

  # A,X Rock
  # B,Y Paper
  # C,Z Scissor

  def total_round_score(opponent_choice, my_choice) do
    shape_score(my_choice) + round_score(opponent_choice, my_choice)
  end

  def shape_score("X"), do: 1
  def shape_score("Y"), do: 2
  def shape_score("Z"), do: 3

  def round_score("A", "X"), do: 3
  def round_score("A", "Y"), do: 6
  def round_score("A", "Z"), do: 0
  def round_score("B", "X"), do: 0
  def round_score("B", "Y"), do: 3
  def round_score("B", "Z"), do: 6
  def round_score("C", "X"), do: 6
  def round_score("C", "Y"), do: 0
  def round_score("C", "Z"), do: 3

  def parse_data(data) do
    data
    |> String.trim()
    |> String.split("\n")
  end
end

defmodule AOC.Day02.Part2 do
  def solve(data) do
    data
    |> parse_data
    |> Enum.map(fn x ->
      [opponent_choice, my_choice] = String.split(x)
      total_round_score(opponent_choice, my_choice)
    end)
    |> Enum.sum()
  end

  # A Rock
  # B Paper
  # C Scissor

  # X lose
  # Y draw
  # Z win

  def total_round_score(opponent_choice, my_expected_outcome) do
    my_choice = my_choice(opponent_choice, my_expected_outcome)
    shape_score(my_choice) + round_score(opponent_choice, my_choice)
  end

  def shape_score("A"), do: 1
  def shape_score("B"), do: 2
  def shape_score("C"), do: 3

  def my_choice("A", "X"), do: "C"
  def my_choice("A", "Y"), do: "A"
  def my_choice("A", "Z"), do: "B"
  def my_choice("B", "X"), do: "A"
  def my_choice("B", "Y"), do: "B"
  def my_choice("B", "Z"), do: "C"
  def my_choice("C", "X"), do: "B"
  def my_choice("C", "Y"), do: "C"
  def my_choice("C", "Z"), do: "A"

  def round_score("A", "A"), do: 3
  def round_score("A", "B"), do: 6
  def round_score("A", "C"), do: 0
  def round_score("B", "A"), do: 0
  def round_score("B", "B"), do: 3
  def round_score("B", "C"), do: 6
  def round_score("C", "A"), do: 6
  def round_score("C", "B"), do: 0
  def round_score("C", "C"), do: 3

  def parse_data(data) do
    data
    |> String.trim()
    |> String.split("\n")
  end
end
