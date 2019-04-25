defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    Regex.scan(~r/[\pL\pN-]+/u, sentence)
    |> List.flatten
    |> process_words(%{})
  end

  defp process_words([], wordmap) do
    wordmap
  end
  defp process_words(wordlist, wordmap) do
    [ h | t ] = wordlist

    newmap = word_downcase(h) 
      |> word_map_update(wordmap)

    process_words(t, newmap)
  end

  defp word_downcase(word) do
    String.downcase(word)
  end

  defp word_map_update(word, wordmap) do
    Map.update(wordmap, word, 1, &(&1 + 1))
  end

end
