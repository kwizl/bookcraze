class Article < ApplicationRecord
  belongs_to :user
  
  has_many :categories
  has_many :votes
  
  has_one_attached :image
  
  validates :title, presence: true
  validates :text, presence: true
end
