class MakeGameDescriptionsIntoText < ActiveRecord::Migration
  def change
    change_column :games, :description, :text
    change_column :other_games, :description, :text
    change_column :wpm_tests, :body, :text

  end
end
