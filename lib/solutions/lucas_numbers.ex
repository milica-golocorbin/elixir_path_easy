defmodule Solutions.LucasNumbers do
  @moduledoc """
  Lucas numbers are an infinite sequence of numbers which build progressively
  which hold a strong correlation to the golden ratio.
  
  E.g.: 2, 1, 3, 4, 7, 11, 18, 29, ...
  """
  # SOLUTION 01
  def generate(count) when is_integer(count) and count > 2 do
    sequence =
      {2, 1}
      |> Stream.iterate(fn {a, b} -> {b, a + b} end)
      |> Stream.map(&elem(&1, 1))
      |> Enum.take(count - 1)

    [2 | sequence]
  end

  # SOLUTION 02
  # def generate(count) when is_integer(count) and count > 2 do
  #   sequence = Stream.unfold({2, 1}, fn {a, b} -> {a, {b, a + b}} end)
  #   Enum.take(sequence, count)
  # end

  def generate(1), do: [2]
  def generate(2), do: [2, 1]
  def generate(_), do: raise(ArgumentError, "count must be specified as an integer >= 1")
end
