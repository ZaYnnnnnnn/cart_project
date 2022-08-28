class Category < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 12 }
  validates_uniqueness_of :title
end