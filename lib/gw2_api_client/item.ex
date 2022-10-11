defmodule Gw2ApiClient.Item do
  @moduledoc """
  Get items
  """
  import Gw2ApiClient.Helpers

  def get(id) do
    get_(["items", Integer.to_string(id)])
  end

  def all do
    get_(["items"])
  end
end
