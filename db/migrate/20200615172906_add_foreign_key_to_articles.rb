# This migration comes from active_storage (originally 20170806125915)
class AddForeignKeyToArticles < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :articles, :categories
  end
end
