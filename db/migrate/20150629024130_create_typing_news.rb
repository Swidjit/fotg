class CreateTypingNews < ActiveRecord::Migration
  def change
    create_table :typing_news do |t|
      t.string :title
      t.text :body
      t.string :url
      t.string :slug
      t.timestamps

    end
  end
end
