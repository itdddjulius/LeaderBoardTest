json.array!(@games) do |game|
  json.extract! game, :id, :title, :gameID
  json.url game_url(game, format: :json)
end
