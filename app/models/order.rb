class Order < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :order_type, presence: true, inclusion: { in: %w[buy sell] }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :status, inclusion: { in: %w[pending completed canceled] }
end
