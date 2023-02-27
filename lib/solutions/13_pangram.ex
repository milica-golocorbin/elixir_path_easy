defmodule Solutions.Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.
  
  Returns a boolean.
  
    ## Examples
  
      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true
  
  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    alphabet = MapSet.new(?a..?z)
    candidate = sentence |> String.downcase() |> to_charlist |> MapSet.new()
    MapSet.subset?(alphabet, candidate)
  end
end
