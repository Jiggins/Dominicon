json.array!(@games_boardgames) do |games_boardgame|
  json.extract! games_boardgame, :id, :name, :description, :publisher, :url, :image, :min_players, :max_players, :slug
  json.url games_boardgame_url(games_boardgame, format: :json)
end
