class AddReleasedToGamesConsole < ActiveRecord::Migration
  def change
    add_column :games_consoles, :released, :datetime
  end
end
