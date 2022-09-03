defmodule Gw2Helper.Data.GetItems do
  alias Gw2Helper.Items
  alias Gw2ApiClient.Item, as: ItemClient

  def list_items do
    ItemClient.all()
  end
end
