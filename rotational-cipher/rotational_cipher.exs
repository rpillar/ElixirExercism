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

  def transform(char, shift) when char in ?a..?z do
    transform_char(?a..?z, char, shift)
  end

  def transform(char, shift) when char in ?A..?Z do
    transform_char(?A..?Z, char, shift)
  end

  def transform(char, _) do
    char
  end

  defp transform_char(charset, char, shift) do
    if ( ( char + shift ) > Enum.max(charset) ) do
      ( Enum.min(charset) + ( (char + shift) - Enum.max(charset) ) ) -1
    else
      char + shift
    end
  end

end
