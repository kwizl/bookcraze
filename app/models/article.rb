class Article < ApplicationRecord
  belongs_to :user
  
  has_many :categories
  has_many :votes

  validates :title, presence: true
  validates :text, presence: true
end
