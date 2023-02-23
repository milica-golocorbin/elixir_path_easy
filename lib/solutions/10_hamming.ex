defmodule Solutions.Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.
  
  ## Examples
  
  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    strand_one = convert(strand1)
    strand_two = convert(strand2)

    if length(strand1) == length(strand2) do
      diff = Enum.zip(strand_one, strand_two) |> Enum.count(fn {a, b} -> a != b end)
      {:ok, diff}
    else
      {:error, "strands must be of equal length"}
    end
  end

  defp convert(char) do
    char
    |> to_string()
    |> String.codepoints()
  end
end
