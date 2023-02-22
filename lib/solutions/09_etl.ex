defmodule Solutions.ETL do
  @doc """
  Transforms an old Scrabble score system to a new one.
  
  ## Examples
  
    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  @spec transform(map) :: map

  # SOULTION 01
  # def transform(input) do
  #   Enum.map(input, fn {num, letters} ->
  #     Enum.map(letters, fn letter -> {String.downcase(letter), num} end)
  #   end)
  #   |> List.flatten()
  #   |> Enum.into(%{})
  # end

  # SOULTION 02
  def transform(input) do
    for {num, letters} <- input, letter <- letters, into: %{} do
      {String.downcase(letter), num}
    end

    # for {num, letters} <- input, letter <- letters, into: %{}, do: {String.downcase(letter), num}
  end
end
