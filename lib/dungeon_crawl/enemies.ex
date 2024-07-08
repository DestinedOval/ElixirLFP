defmodule DungeonCrawl.Enemies do
  alias DungeonCrawl.Character

  def all,
    do: [
      %Character{
        name: "Ogre",
        description: "a large creature. Big muscles. Angry and hungry",
        hit_points: 12,
        max_hit_points: 12,
        damage_range: 3..5,
        attack_description: "a hammer",
        loot: Enum.random(1..2)
      },
      %Character{
        name: "Skeleton",
        description:
          "the reanimated remains of a long dead warrior. It carries a rusted shortsword",
        hit_points: 6,
        max_hit_points: 6,
        damage_range: 2..4,
        attack_description: "a rusted shortsword",
        loot: Enum.random(1..3)
      },
      %Character{
        name: "Goblin",
        description:
          "a small, green, hunched over creature. It wears dirty rags and wields a dagger",
        hit_points: 4,
        max_hit_points: 4,
        damage_range: 1..2,
        attack_description: "a dagger",
        loot: Enum.random(2..6)
      },
      %Character{
        name: "Swarm of Bats",
        description:
          "a squeaking horde of bats. They flap around on leathery wings and swoop towards you",
        hit_points: 4,
        max_hit_points: 4,
        damage_range: 1..5,
        attack_description: "a series of tiny, stinging bites",
        loot: 0
      }
    ]
end
