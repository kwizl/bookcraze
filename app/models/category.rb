class Category < ApplicationRecord
  belongs_to :article

  validates_presence_of :name
  validates_presence_of :priority

  def self.category_articles(category_id)
    find_by_sql(['SELECT * FROM categories WHERE id = ?', category_id])
  end
end
