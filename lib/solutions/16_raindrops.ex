defmodule Solutions.Raindrops do
  @doc """
  Returns a string based on raindrop factors.
  
  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """

  @raindrops %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    case Enum.filter(@raindrops, fn {num, sound} -> if rem(number, num) == 0, do: sound end) do
      [] ->
        to_string(number)

      # pattern match for non empty list
      [_ | _] = result ->
        Enum.map(result, fn {_num, sound} -> sound end) |> Enum.join()
    end
  end
end
