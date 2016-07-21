class AddImdBidToGamesConsole < ActiveRecord::Migration
  def change
    add_column :games_consoles, :imdbID, :string
  end
end
