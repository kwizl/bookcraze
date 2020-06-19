# This migration comes from active_storage (originally 20170806125915)
class AddForeignKeyToArticle < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :category, null: true, foreign_key: true
    end
  end
end
