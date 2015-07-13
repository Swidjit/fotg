class AddGameSessionToScores < ActiveRecord::Migration
  def change
    add_column :scores, :game_session, :integer, :null=>:false
  end
end
