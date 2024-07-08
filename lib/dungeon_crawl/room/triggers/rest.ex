defmodule DungeonCrawl.Room.Triggers.Rest do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
    {character, :forward}
  end

  # TODO: This currently heals no matter what - fix (maybe in Character.heal())
  # i.e. you're at full health and it shows "you heal for 5"
  def run(character, %DungeonCrawl.Room.Action{id: :rest}) do
    healing_value = Enum.random(3..6)
    updated_char = Character.heal(character, healing_value)
    Shell.info("You take a moment to catch your breath and bandage your wounds.")
    Shell.info("You heal for #{healing_value} HP.")
    Shell.info("You now have #{updated_char.hit_points} / #{updated_char.max_hit_points} HP.")
    {updated_char, :forward}
  end
end
