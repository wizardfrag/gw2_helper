defmodule Gw2Helper.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :game_id, :integer, unique: true
      add :name, :text, null: false
      add :description, :text

      add :type, :text

      add :level, :integer

      add :rarity, :text

      add :vendor_value, :integer

      add :game_types, {:array, :text}

      add :flags, {:array, :text}
      add :restrictions, {:array, :text}

      add :chat_link, :text
      add :api_response, :json

      timestamps()
    end
  end
end
