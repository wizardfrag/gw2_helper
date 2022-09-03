defmodule Gw2Helper.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gw2Helper.Items` context.
  """

  @doc """
  Generate an item.
  """
  def item_fixture(attrs \\ %{name: "Item fixture"}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{})
      |> Gw2Helper.Items.create_item()

    item
  end

  def api_fixture do
    %{
      "chat_link" => "[&CHAT]",
      "default_skin" => 3942,
      "description" => "",
      "details" => %{
        "attribute_adjustment" => 242.352,
        "damage_type" => "Physical",
        "defense" => 0,
        "infix_upgrade" => %{
          "attributes" => [
            %{"attribute" => "Power", "modifier" => 85},
            %{"attribute" => "Precision", "modifier" => 61}
          ],
          "id" => 142
        },
        "infusion_slots" => [],
        "max_power" => 452,
        "min_power" => 385,
        "secondary_suffix_item_id" => "",
        "suffix_item_id" => 24547,
        "type" => "LongBow"
      },
      "flags" => ["SoulBindOnUse"],
      "game_types" => ["Activity", "Wvw", "Dungeon", "Pve"],
      "icon" => "https://item",
      "id" => 28445,
      "level" => 44,
      "name" => "Longbow",
      "rarity" => "Masterwork",
      "restrictions" => [],
      "type" => "Weapon",
      "vendor_value" => 120
    }
  end
end
