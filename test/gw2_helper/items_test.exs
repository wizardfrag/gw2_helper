defmodule Gw2Helper.ItemsTest do
  use Gw2Helper.DataCase

  alias Gw2Helper.Items

  describe "items" do
    alias Gw2Helper.Items.Item

    import Gw2Helper.ItemsFixtures

    @invalid_attrs %{"level" => "100"}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Items.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Items.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates an item" do
      valid_attrs = %{name: "Hello"}

      assert {:ok, %Item{} = item} = Items.create_item(valid_attrs)
      assert item.name == "Hello"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{name: "New Item", level: 80}

      assert {:ok, %Item{} = item} = Items.update_item(item, update_attrs)
      assert item.name == "New Item"
      assert item.level == 80
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_item(item, @invalid_attrs)
      assert item == Items.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Items.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Items.get_item!(item.id) end
    end

    test "change_item/1 returns an item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Items.change_item(item)
    end

    test "create_item_from_api_response/1 with valid data creates an item" do
      api_response = api_fixture()

      assert {:ok, %Item{} = item} = Items.create_item_from_api_response(api_response)

      assert %Gw2Helper.Items.Item{
               name: "Longbow",
               description: nil,
               game_id: 28445,
               type: :Weapon,
               level: 44,
               rarity: :Masterwork,
               game_types: [:Activity, :Wvw, :Dungeon, :Pve],
               flags: [:SoulBindOnUse],
               chat_link: "[&CHAT]"
             } = item
    end
  end
end
