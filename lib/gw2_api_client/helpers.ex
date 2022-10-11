defmodule Gw2ApiClient.Helpers do
  @moduledoc """
  Helper functions
  """
  require Logger

  defp build_url(path, version) do
    [
      Application.get_env(:gw2_helper, :api_base, "https://api.guildwars2.com"),
      version,
      path
    ]
    |> Enum.join("/")
  end

  defp from_json({:ok, %Finch.Response{status: 200, body: body}}) do
    body
    |> Jason.decode()
  end

  defp from_json(wat) do
    Logger.error("couldn't convert JSON from response: #{inspect(wat)}", response: wat)
    {:error, "Couldn't convert JSON"}
  end

  @spec get_([String.t()], String.t()) ::
          {:error, String.t() | Jason.DecodeError.t()} | {:ok, Map.t()}
  def get_(parts, version \\ "v2") do
    path = parts |> Enum.join("/")
    url = build_url(path, version)

    Finch.build(:get, url)
    |> Finch.request(Gw2Finch)
    |> from_json()
  end
end
