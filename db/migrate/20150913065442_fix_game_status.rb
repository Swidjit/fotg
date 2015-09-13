class FixGameStatus < ActiveRecord::Migration
  def change
    add_column :scores, :score_status, :string
    remove_column :scores, :status
  end
end
