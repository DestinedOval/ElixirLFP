defmodule DungeonCrawl.Room.Triggers.Search do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
    {character, :forward}
  end

  def run(character, %DungeonCrawl.Room.Action{id: :search}) do
    found_loot = Enum.random(3..18)
    updated_char = Character.get_loot(character, found_loot)
    Shell.info("You search around the room for anything of value.")
    Shell.info("You find #{found_loot} gold pieces!")
    Shell.info("You now have #{updated_char.loot} total gold pieces.")
    updated_char = Character.visit_room(updated_char, 1)
    {updated_char, :forward}
  end
end
