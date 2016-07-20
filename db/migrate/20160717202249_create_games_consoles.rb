class CreateGamesConsoles < ActiveRecord::Migration
  def change
    create_table :games_consoles do |t|
      t.string     :name
      t.string     :description
      t.string     :console
      t.string     :publisher
      t.string     :url
      t.integer    :min_players
      t.integer    :max_players
      t.integer    :stock
      t.attachment :image
      t.string     :slug

      t.timestamps null: false
    end
    add_index :games_consoles, :slug, unique: true
  end
end
