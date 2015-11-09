class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.belongs_to :playlist, index: true, foreign_key: true
      t.string :caption
      t.string :link
      t.string :source
      t.string :name
      t.text :fb_message
      t.integer :fb_user_id
      t.string :fb_user_name

      t.timestamps null: false
    end
  end
end
