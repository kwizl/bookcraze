class AddForeignKeyToArticle < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :category, null: true, foreign_key: true
  end
end
