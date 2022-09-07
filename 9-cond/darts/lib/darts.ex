defmodule Darts do
  @type position :: {number, number}
  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  defp target_from(x,y) do
    distance = :math.sqrt(x * x + y * y)
    cond do
      distance <= 1 -> :inner
      distance <= 5 -> :middle
      distance <= 10 -> :outer
      true -> :outside
    end
  end
  
  def score({x, y}) do
    case target_from(x,y) do
      :outside -> 0
      :outer -> 1
      :middle -> 5
      :inner -> 10
    end
  end
end
