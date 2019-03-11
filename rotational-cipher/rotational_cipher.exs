defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do

    text 
      |> String.to_charlist 
      |> Enum.map( fn x -> transform(x, shift) end ) 
      |> List.to_string
  end

  @spec transform(char :: integer, shift :: integer) :: integer
  defp transform(char, shift) do
    cond do
      Enum.member?(lower(), char) ->
        transform_char(lower(), char, shift)

      Enum.member?(upper(), char) ->
        transform_char(upper(), char, shift)
      
      true ->
        char
    end
  end

  defp transform_char(charset, char, shift) do
    if ( ( char + shift ) > Enum.max(charset) ) do
      new_char = ( Enum.min(charset) + ( (char + shift) - Enum.max(charset) ) ) -1
    else
      new_char = char + shift
    end
  end

  defp lower(), do: ?a..?z
  defp upper(), do: ?A..?Z
end
