defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.split(sentence, ~r{\s|_}, trim: true)
    |> process_words(%{})
  end

  defp process_words([], wordmap) do
    wordmap
  end
  defp process_words(wordlist, wordmap) do
    [ h | t ] = wordlist

    newmap = word_downcase(h) 
      |> word_replace
      |> word_map_update(wordmap)

    process_words(t, newmap)
  end

  defp word_downcase(word) do
    String.downcase(word)
  end

  defp word_map_update(word, wordmap) do
    case byte_size(word) > 0 do
      true ->
        Map.update(wordmap, word, 1, &(&1 + 1))
      false ->
        wordmap 
    end
  end

  defp word_replace(word) do
      case String.length(word) == byte_size(word) do
        true ->
          String.replace(word, ~r/\p{P}(?<!-)|\^|\$/, "", global: true)
        false ->
          word
      end
  end

end
