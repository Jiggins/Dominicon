class CreateGamesBoardgames < ActiveRecord::Migration
  def change
    create_table :games_boardgames do |t|
      t.string     :name
      t.string     :description
      t.string     :publisher
      t.string     :url
      t.integer    :min_players
      t.integer    :max_players
      t.integer    :stock
      t.attachment :image
      t.string     :slug

      t.timestamps null: false
    end
    add_index :games_boardgames, :slug, unique: true
  end
end
