defmodule Solutions.AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}

  def convert(digits, input_base, output_base) when input_base >= 2 and output_base >= 2 do
    case Enum.any?(digits, fn num -> num < 0 or num >= input_base end) do
      false ->
        input = Integer.undigits(digits, input_base)
        output = Integer.digits(input, output_base)
        {:ok, output}

      true ->
        {:error, "all digits must be >= 0 and < input base"}
    end
  end

  def convert(_digits, input_base, output_base) when input_base < 2 and output_base < 2 do
    {:error, "output base must be >= 2"}
  end

  def convert(_digits, input_base, _output_base) when input_base < 2 do
    {:error, "input base must be >= 2"}
  end

  def convert(_digits, _input_base, output_base) when output_base < 2 do
    {:error, "output base must be >= 2"}
  end
end
