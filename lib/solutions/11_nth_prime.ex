defmodule Solutions.NthPrime do
  @doc """
  Generates the nth prime.
  """

  @spec nth(non_neg_integer) :: non_neg_integer

  def nth(count) when count < 1, do: raise("there is no zeroth prime")

  def nth(count) when is_integer(count) do
    # t1 = Time.utc_now()

    Stream.iterate(2, &(&1 + 1))
    |> Stream.filter(&prime?/1)
    |> Enum.take(count)
    |> IO.inspect()
    |> Enum.at(count - 1)

    # t2 = Time.utc_now()
    # IO.inspect(Time.diff(t2, t1))
  end

  defp prime?(number) when number < 2, do: false
  defp prime?(2), do: true

  defp prime?(number) do
    2..ceil(:math.sqrt(number))
    |> Enum.all?(fn x -> rem(number, x) != 0 end)
  end

  # THIS SOLUTION IS SUPER SLOW
  # defp prime?(3), do: true

  # defp prime?(number) do
  #   2..div(number, 2)
  #   |> Enum.all?(fn x -> rem(number, x) != 0 end)
  # end
end

# How to determine if a number is prime
# https://www.techtarget.com/whatis/definition/prime-number#:~:text=A%20prime%20number%20is%20a,factors%20are%20called%20composite%20numbers.
