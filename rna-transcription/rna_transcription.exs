defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, fn x -> swap_dna(x) end)
    |> List.flatten
  end

  defp swap_dna(dna_char) do
    case dna_char do
        ?A -> ?U
        ?C -> ?G
        ?T -> ?A
        ?G -> ?C
    end
  end

end
