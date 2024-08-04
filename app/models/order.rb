class Order < ApplicationRecord
  has_and_belongs_to_many :products

  validates :status, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :checkout_id, presence: true
  validates :payment_link, presence: true
end
