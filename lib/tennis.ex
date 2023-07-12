defmodule Tennis do
  def results() do
    p1 = ScoreBoard.value(:p1)
    p2 = ScoreBoard.value(:p2)

    cond do
      p1 == 0 and p2 == 0 -> "0 - 0"
      p1 == 3 and p2 == 3 -> "Deuce"
      (p1 > 3 or p2 > 3) and p1 - p2 == 1 -> "Adv Player 1"
      (p1 > 3 or p2 > 3) and p2 - p1 == 1 -> "Adv Player 2"
      (p1 > 3 or p2 > 3) and p1 - p2 > 1 -> "Player 1 wins"
      (p1 > 3 or p2 > 3) and p2 - p1 > 1 -> "Player 2 wins"
      true -> "#{parse_scoring(p1)} - #{parse_scoring(p2)}"
    end
  end

  def makes_point(name) do
    ScoreBoard.increment(name)
    results()
  end

  def parse_scoring(value) do
    case value do
      0 -> "love"
      1 -> "15"
      2 -> "30"
      3 -> "40"
      _ -> to_string(value)
    end
  end
end
