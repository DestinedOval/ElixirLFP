defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action

  defstruct label: nil, id: nil

  def forward, do: %Action{id: :forward, label: "Move forward."}
  def rest, do: %Action{id: :rest, label: "Take some time to rest."}
  def search, do: %Action{id: :search, label: "Search the room."}
  def flee, do: %Action{id: :flee, label: "Try and get away."}

  defimpl String.Chars do
    def to_string(action), do: action.label
  end

  @type t :: %Action{id: atom, label: String.t()}
end
