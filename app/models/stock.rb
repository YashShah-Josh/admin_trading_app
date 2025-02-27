class Stock < ApplicationRecord
    has_many :orders, dependent: :destroy
    has_many :transactions, dependent: :destroy
  
    validates :symbol, presence: true, uniqueness: true, length: { maximum: 10 }
    validates :company_name, presence: true, length: { minimum: 2 }
    validates :current_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :price_change, numericality: true
  end
  