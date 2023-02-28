defmodule Solutions.ProteinTranslation do
  @codons %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna) do
    strands = transform(rna)

    Enum.reduce_while(strands, {:ok, []}, fn strand, {:ok, acc_list} = acc ->
      case Map.get(@codons, strand) do
        "STOP" ->
          {:halt, acc}

        nil ->
          {:halt, {:error, "invalid RNA"}}

        protein ->
          acc = {:ok, acc_list ++ [protein]}
          {:cont, acc}
      end
    end)
  end

  defp transform(rna) do
    rna
    |> String.split("", trim: true)
    |> Enum.chunk_every(3)
    |> Enum.map(fn strand -> Enum.join(strand) end)
  end

  @doc """
  Given a codon, return the corresponding protein
  
  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    case Enum.find_value(@codons, fn {match, protein} -> if codon == match, do: protein end) do
      nil -> {:error, "invalid codon"}
      protein -> {:ok, protein}
    end
  end
end
