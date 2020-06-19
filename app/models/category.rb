class Category < ApplicationRecord
  belongs_to :article

  validates :name, presence: true
  validates :priority, presence: true

  def self.category_articles(category_id)
    find_by_sql(['SELECT * FROM categories WHERE id = ?', category_id])
  end
end
