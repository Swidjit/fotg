class RemoveGameNumFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :expected_score
    remove_column :games, :game_num
    remove_column :games, :logo_url
  end
end
