defmodule Solutions.Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.filter(fn candidate -> String.length(candidate) == String.length(base) end)
    # |> IO.inspect()
    |> Enum.filter(fn candidate -> String.downcase(candidate) != String.downcase(base) end)
    # |> IO.inspect()
    |> Enum.filter(fn candidate -> anagram(base) == anagram(candidate) end)
  end

  defp anagram(word) do
    word
    |> String.downcase()
    |> String.codepoints()
    |> Enum.sort()
  end
end
