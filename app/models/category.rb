class Category < ApplicationRecord
  belongs_to :article

  validates_presence_of :name
end
