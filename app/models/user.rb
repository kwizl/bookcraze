class User < ApplicationRecord
  has_many :articles
  has_many :votes

  validates :name, presence: true
  validates_uniqueness_of :name
end
