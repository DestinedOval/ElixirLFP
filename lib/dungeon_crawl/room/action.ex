defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action

  defstruct label: nil, id: nil

  def forward, do: %Action{id: :forward, label: "Keep moving."}
  def rest, do: %Action{id: :rest, label: "Take some time to rest."}
  def search, do: %Action{id: :search, label: "Search the room."}

  defimpl String.Chars do
    def to_string(action), do: action.label
  end

  @type t :: %Action{id: atom, label: String.t()}
end
