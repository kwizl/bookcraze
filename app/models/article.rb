class Article < ApplicationRecord
  belongs_to :user
  
  has_many :categories
  has_many :votes
  
  has_one_attached :image
  
  validates :title, presence: true
  validates :text, presence: true
  validates_associated :categories

  accepts_nested_attributes_for :categories
 
  def main_thumbnail
    return self.image.variant(resize: '1150x600!').processed
  end

  def secondary_thumbnail
    return self.image.variant(resize: '900x400!').processed
  end

  def thumbnail
    return self.image.variant(resize: '220x220!').processed
  end

  def total_votes
    return self.votes.count
  end

  def self.categories_order
    find_by_sql(['SELECT * FROM articles a JOIN categories c ON a.id = c.article_id 
      WHERE a.id = c.article_id GROUP BY c.name ORDER BY c.priority ASC'])
  end

  def self.category_article(name)
    find_by_sql(['SELECT * FROM articles a JOIN categories c ON a.id = c.article_id WHERE c.name = ?', name])
  end

  def self.most_voted(article_id)
    find_by_sql(['SELECT * FROM articles WHERE id = ?', article_id])
  end

  def self.other_voted(article_id)
    find_by_sql(['SELECT * FROM articles WHERE id != ? ORDER BY created_at DESC', article_id])
  end
end
