class CreateOtherGames < ActiveRecord::Migration
  def change
    create_table :other_games do |t|
      t.string :title, :null => :false
      t.string :description
      t.string :image_url
      t.string :slug
      t.integer :difficulty_level
    end
  end
end
