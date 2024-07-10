defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def some,
    do: [
      %Room{
        description: "You find a secure room where you can rest.",
        actions: [forward(), rest()],
        trigger: Triggers.Rest
      },
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [forward(), flee()],
        trigger: Triggers.Enemy
      },
      %Room{
        description:
          "You hit a dead end, as you make your way back you run into a roaming enemy.",
        actions: [forward(), flee()],
        trigger: Triggers.Enemy
      },
      %Room{
        description:
          "You find a room devoid of enemies, there is a dust-covered chest in the corner.",
        actions: [forward(), search()],
        trigger: Triggers.Search
      }
    ]

  def all,
    do: [
      %Room{
        description: "You can see the light of day. You found the exit!",
        actions: [forward()],
        trigger: Triggers.Exit
      },
      %Room{
        description: "You find a secure room where you can rest.",
        actions: [forward(), rest()],
        trigger: Triggers.Rest
      },
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [forward(), flee()],
        trigger: Triggers.Enemy
      },
      %Room{
        description:
          "You hit a dead end, as you make your way back you run into a roaming enemy.",
        actions: [forward(), flee()],
        trigger: Triggers.Enemy
      },
      %Room{
        description:
          "You come to an abandoned supply room, maybe you'll find something of value.",
        actions: [forward(), search()],
        trigger: Triggers.Search
      }
    ]
end
