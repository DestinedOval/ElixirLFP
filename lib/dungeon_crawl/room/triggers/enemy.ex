defmodule DungeonCrawl.Room.Triggers.Enemy do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
    enemy = Enum.random(DungeonCrawl.Enemies.all())

    Shell.info("You see #{enemy.description}.")
    Shell.info("The enemy #{enemy.name} wants to fight.")
    Shell.info("You were prepared and attack first.")
    {updated_char, _enemy, loot} = DungeonCrawl.Battle.fight(character, enemy)
    updated_char = Character.get_loot(updated_char, loot)
    Shell.info("\nYou find #{loot} gold pieces after the battle.\n")
    Shell.info("You now have #{updated_char.loot} gold pieces.\n")
    {updated_char, :forward}
  end
end
