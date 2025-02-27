class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :transaction_type, presence: true, inclusion: { in: %w[buy sell] }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :total_amount, presence: true, numericality: { greater_than: 0 }
end
