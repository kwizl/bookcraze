class Category < ApplicationRecord
  belongs_to :article

  validates :name, presence: true
  validates :priority, presence: true
  validates :priority, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }

  def self.category_articles(category_id)
    find_by_sql(['SELECT * FROM categories WHERE id = ?', category_id])
  end
end
