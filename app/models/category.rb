class Category < ApplicationRecord
  belongs_to :article

  validates_presence_of :name
  validates_presence_of :priority

  def self.category_articles(category_id)
    find_by_sql(['SELECT * FROM articles a JOIN categories c ON a.category_id = c.id WHERE a.category_id = ?', category_id])
  end
end
