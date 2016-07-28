class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string     :name
      t.string     :description
      t.string     :type
      t.string     :location
      t.string     :html_link
      t.datetime   :start
      t.datetime   :end
      t.attachment :image
      t.string     :event_id
      t.string     :i_cal_uid
      t.string     :slug

      t.timestamps null: false
    end
    add_index :events, :slug, unique: true
  end
end
