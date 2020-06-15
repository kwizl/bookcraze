class Article < ApplicationRecord
  belongs_to :user
  
  has_many :categories
  has_many :votes
  
  has_one_attached :image
  
  validates :title, presence: true
  validates :text, presence: true

  def main_thumbnail
    return self.image.variant(resize: '700x500').processed
  end

  def secondary_thumbnail
    return self.image.variant(resize: '400x500').processed
  end

  def thumbnail
    return self.image.variant(resize: '300x300!').processed
  end
end
