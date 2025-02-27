class Stock < ApplicationRecord
  # Associations
  has_many :orders
  has_many :transactions

  # Validations
  validates :symbol, presence: true, uniqueness: true
  validates :company_name, presence: true
  validates :current_price, numericality: { greater_than_or_equal_to: 0 }
  validates :price_change, numericality: true
end
