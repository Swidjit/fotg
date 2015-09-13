class AddSlugToTypingNews < ActiveRecord::Migration
  def change
    add_column :typing_news, :slug, :string
  end
end
