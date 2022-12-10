defmodule AOC.InputData do
  def read(day) do
    File.read!('#{__DIR__}/day_#{day}/input.txt')
  end
end
