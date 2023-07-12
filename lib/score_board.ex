defmodule ScoreBoard do
  use Agent

  def start_link(init_value) do
    Agent.start_link(fn -> init_value end, name: __MODULE__)
  end

  def value(player) do
    Agent.get(__MODULE__, & &1[player])
  end

  def increment(player) do
    Agent.update(__MODULE__, &Map.update!(&1, player, fn score -> score + 1 end))
  end
end
