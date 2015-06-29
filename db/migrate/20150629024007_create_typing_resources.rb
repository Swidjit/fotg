class CreateTypingResources < ActiveRecord::Migration
  def change
    create_table :typing_resources do |t|
      t.string :title
      t.string :url
      t.string :description
      t.timestamps
    end
  end
end
