class Product < ApplicationRecord
 validates :title, presence: true, length: { minimum: 3, maximum:25}
 validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
end