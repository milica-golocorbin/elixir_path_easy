defmodule Solutions.ResistorColor do
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Return the value of a color band
  """

  @spec code(atom) :: integer()
  def code(color) do
    {_color_key, color_value} =
      Enum.find(@colors, fn {color_key, _color_value} -> color_key == color end)

    color_value
  end
end
