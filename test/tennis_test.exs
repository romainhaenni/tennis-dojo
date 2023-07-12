defmodule TennisTest do
  use ExUnit.Case
  doctest Tennis

  setup do
    ScoreBoard.start_link(%{p1: 0, p2: 0})
    :ok
  end

  test "Game starts" do
    assert Tennis.results() == "0 - 0"
  end

  test "Player 1 makes a point" do
    Tennis.makes_point(:p1)
    assert Tennis.results() == "15 - love"
  end

  test "Player 2 makes a point" do
    Tennis.makes_point(:p2)
    assert Tennis.results() == "love - 15"
  end

  test "Player 1 scores twice, Player 2 scores once" do
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p2)
    assert Tennis.results() == "30 - 15"
  end

  test "Player 1 scores three times, Player 2 scores twice" do
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    assert Tennis.results() == "40 - 30"
  end

  test "Player 1 scores three times, Player 2 three times (Deuce)" do
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    assert Tennis.results() == "Deuce"
  end

  test "Player 1 scores four times, Player 2 scores three times (Player 1 has advantage)" do
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    assert Tennis.results() == "Adv Player 1"
  end

  test "Player 1 scores three times, Player 2 scores four times (Player 2 has advantage)" do
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    assert Tennis.results() == "Adv Player 2"
  end

  test "Player 1 scores five times, Player 2 scores three times (Player 1 wins)" do
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    assert Tennis.results() == "Player 1 wins"
  end

  test "Player 1 scores four times, Player 2 scores once (Player 1 wins)" do
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p2)
    assert Tennis.results() == "Player 1 wins"
  end

  test "Player 1 scores once, Player 2 four times (Player 2 wins)" do
    Tennis.makes_point(:p1)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    Tennis.makes_point(:p2)
    assert Tennis.results() == "Player 2 wins"
  end
end
