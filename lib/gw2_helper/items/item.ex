defmodule Gw2Helper.Items.Item do
  @moduledoc """
  Represents a guild wars 2 item as returned from the API
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "items" do
    field :name, :string
    field :description, :string
    field :game_id, :integer

    field :type, Ecto.Enum,
      values: [
        :Armor,
        :Back,
        :Bag,
        :Consumable,
        :Container,
        :CraftingMaterial,
        :Gathering,
        :Gizmo,
        :Key,
        :MiniPet,
        :Tool,
        :Trait,
        :Trinket,
        :Trophy,
        :UpgradeComponent,
        :Weapon
      ]

    field :level, :integer

    field :rarity, Ecto.Enum,
      values: [:Junk, :Basic, :Fine, :Masterwork, :Rare, :Exotic, :Ascended, :Legendary]

    field :game_types, {:array, Ecto.Enum},
      values: [:Activity, :Dungeon, :Pve, :Pvp, :PvpLobby, :Wvw]

    field :flags, {:array, Ecto.Enum},
      values: [
        :AccountBindOnUse,
        :AccountBound,
        :Attuned,
        :BulkConsume,
        :DeleteWarning,
        :HideSuffix,
        :Infused,
        :MonsterOnlyNoMysticForge,
        :NoSalvage,
        :NoSell,
        :NotUpgradeable,
        :NoUnderwater,
        :SoulbindOnAcquire,
        :SoulBindOnUse,
        :Tonic,
        :Unique
      ]

    field :chat_link, :string
    field :api_response, :map

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [
      :name,
      :description,
      :game_id,
      :type,
      :level,
      :rarity,
      :game_types,
      :flags,
      :chat_link
    ])
    |> validate_required([:name])
    |> validate_number(:level, less_than_or_equal_to: 80)
  end

  def api_changeset(item, attrs) do
    item
    |> cast(attrs, [
      :name,
      :description,
      :game_id,
      :type,
      :level,
      :rarity,
      :game_types,
      :flags,
      :chat_link,
      :api_response
    ])
  end
end
