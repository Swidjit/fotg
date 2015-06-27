class AddFileNameToGames < ActiveRecord::Migration
  def change
    add_column :other_games, :file_name, :string, :null => :false
  end
end
