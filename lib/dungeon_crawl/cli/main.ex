defmodule DungeonCrawl.Cli.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("Press Enter to continue")
    crawl(hero_choice(), DungeonCrawl.Room.some())
  end

  defp crawl(%{hit_points: 0}, _) do
    Shell.prompt("")
    Shell.cmd("cls")
    Shell.info("Unfortunately your wounds are too great to carry on.")
    Shell.info("You collapse to the floor and bleed out.")
    Shell.info("Game Over")
    Shell.prompt("")
  end

  defp crawl(character, rooms) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue")
    Shell.cmd("cls")

    Shell.info(DungeonCrawl.Character.current_stats(character))

    rooms
    |> Enum.random()
    |> DungeonCrawl.Cli.RoomActionsChoice.start()
    |> trigger_action(character)
    |> handle_action_result
  end

  defp welcome_message do
    Shell.info("\n=== Dungeon Crawl ===\n")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find the exit.")
  end

  defp hero_choice do
    hero = DungeonCrawl.Cli.HeroChoice.start()
    %{hero | name: "You"}
  end

  defp trigger_action({room, action}, character) do
    Shell.cmd("cls")
    room.trigger.run(character, action)
  end

  defp handle_action_result({character, :exit}) do
    Shell.info("You escaped the dungeon. Congratulations!\n")
    Shell.info("Your final stats are:\n")
    Shell.info(DungeonCrawl.Character.current_stats(character))
  end

  defp handle_action_result({character, _}) do
    if character.rooms_visited > 3 do
      crawl(character, DungeonCrawl.Room.all())
    else
      crawl(character, DungeonCrawl.Room.some())
    end
  end
end
