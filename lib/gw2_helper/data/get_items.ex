defmodule Gw2Helper.Data.GetItems do
  @moduledoc """
  Retrieves items
  """
  alias Gw2ApiClient.Item, as: ItemClient

  def list_items do
    ItemClient.all()
  end
end
