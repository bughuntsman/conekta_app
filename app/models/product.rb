class Product < ApplicationRecord
  has_and_belongs_to_many :orders

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
