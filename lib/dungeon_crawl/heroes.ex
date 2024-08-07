defmodule DungeonCrawl.Heroes do
  alias DungeonCrawl.Character

  def all,
    do: [
      %Character{
        name: "Knight",
        description: "Knight has strong defense and consistent damage",
        hit_points: 18,
        max_hit_points: 18,
        damage_range: 3..4,
        attack_description: "a wsord"
      },
      %Character{
        name: "Sorceror",
        description: "Sorceror has a strong attack, but low health",
        hit_points: 8,
        max_hit_points: 8,
        damage_range: 6..10,
        attack_description: "a fireball"
      },
      %Character{
        name: "Thief",
        description: "Thief has high variability of attack damage",
        hit_points: 12,
        max_hit_points: 12,
        damage_range: 1..12,
        attack_description: "a dagger"
      },
      %Character{
        name: "Cleric",
        description: "Cleric has middling health and damage",
        hit_points: 10,
        max_hit_points: 10,
        damage_range: 4..6,
        attack_description: "a powerful holy strike"
      }
    ]
end
