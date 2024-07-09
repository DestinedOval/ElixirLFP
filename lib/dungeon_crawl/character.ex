defmodule DungeonCrawl.Character do
  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil,
            loot: 0,
            rooms_visited: 0

  defimpl String.Chars do
    def to_string(character), do: character.name
  end

  @type t :: %DungeonCrawl.Character{
          name: String.t(),
          description: String.t(),
          hit_points: non_neg_integer(),
          max_hit_points: non_neg_integer(),
          attack_description: String.t(),
          damage_range: Range.t(),
          loot: non_neg_integer(),
          rooms_visited: non_neg_integer()
        }

  def take_damage(character, damage) do
    new_hit_points = max(0, character.hit_points - damage)
    %{character | hit_points: new_hit_points}
  end

  def heal(character, healing_value) do
    new_hit_points =
      min(
        character.hit_points + healing_value,
        character.max_hit_points
      )

    %{character | hit_points: new_hit_points}
  end

  def get_loot(character, loot_found) do
    new_loot = character.loot + loot_found
    %{character | loot: new_loot}
  end

  def visit_room(character, number_of_rooms) do
    updated_rooms = character.rooms_visited + number_of_rooms
    %{character | rooms_visited: updated_rooms}
  end

  def current_stats(character),
    do:
      "=== Player Stats ===\nHP: #{character.hit_points}/#{character.max_hit_points}\nLoot: #{character.loot} gold pieces\nRooms Visited: #{character.rooms_visited}\n"
end
