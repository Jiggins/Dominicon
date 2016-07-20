class AddOwnerToGamesConsole < ActiveRecord::Migration
  def change
    add_column :games_consoles, :owner, :string
  end
end
