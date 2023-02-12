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

  def code(color) when is_atom(color) do
    case Enum.find(@colors, fn {color_key, _color_value} -> color_key == color end) do
      {_color_key, color_value} -> color_value
      nil -> "No match"
    end
  end

  def code(_), do: "No match"
end
