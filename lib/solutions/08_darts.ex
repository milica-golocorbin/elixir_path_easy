defmodule Solutions.Darts do
  @doc """
  Calculate the score of a single dart hitting a target
  """
  @type position :: {number, number}
  @spec score(position) :: integer
  def score({x, y}) do
    target = x * x + y * y
    result = :math.sqrt(target)

    cond do
      result > 10 -> 0
      result > 5 -> 1
      result > 1 -> 5
      result <= 1 -> 10
    end
  end
end

# cartesian coordinate circle distance equation
# The equation of a circle is (x − a)2 + (y − b)2 = r2 where a and b are the coordinates of the center (a, b) and r is the radius.
# (x − 0)2 + (y − 0)2 = r2
# (x)2 + (y)2 = r2
