defmodule Solutions.Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.split(string, [" ", "-", "_"], trim: true)
    |> Enum.map(fn word -> String.first(word) end)
    |> Enum.join()
    |> String.upcase()
  end
end
