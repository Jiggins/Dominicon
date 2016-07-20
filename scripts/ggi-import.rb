#! bin/rails runner

require 'csv'

include GamesHelper

# Headers:
#   console, game_title, save_file, multiplayer, main_controller, sec_controller#

CSV.foreach "scripts/ggi-catalogue.csv" do |row|
  console = row[0].make_sym
  name    = row[1]
  players = row[3]

  replacements = {
    'No'           => '1',
    'Two Player'   => '2',
    'Four Player'  => '4',
    'Five Player'  => '5',
    'Eight Player' => '8'
  }

  matcher = /#{replacements.keys.join('|')}/

  players.gsub!(matcher, replacements)

  Games::Console.create! name: name, console: console, min_players: 1, max_players: players.to_i, stock: 1, owner: :ggi
  Games::Console.where(slug: 'game-title').first.destroy # Kill the header line
end

