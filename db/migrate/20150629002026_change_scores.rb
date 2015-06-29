class ChangeScores < ActiveRecord::Migration
  def change
    remove_column :scores, :game_num
    remove_column :scores, :game_id
    add_column :scores, :scoreable_id, :integer
    add_column :scores, :scoreable_type, :string
  end
end
