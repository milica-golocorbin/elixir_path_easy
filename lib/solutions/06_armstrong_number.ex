defmodule Solutions.ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    numbers_list = Integer.digits(number)
    exponent = length(numbers_list)

    number ==
      Enum.map(numbers_list, fn number -> Integer.pow(number, exponent) end)
      |> Enum.sum()

    # |> IO.inspect()
  end
end
