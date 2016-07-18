json.array!(@games_consoles) do |games_console|
  json.extract! games_console, :id, :name, :description, :console, :publisher, :url, :image, :min_players, :max_players, :image, :slug
  json.url games_console_url(games_console, format: :json)
end
