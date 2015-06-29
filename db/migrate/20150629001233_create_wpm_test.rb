class CreateWpmTest < ActiveRecord::Migration
  def change
    create_table :wpm_tests do |t|
      t.string :title, :null => :false
      t.string :body
      t.string :slug
      t.integer :difficulty_level
    end
  end
end
