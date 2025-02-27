class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  TRANSACTION_TYPES = %w[buy sell].freeze

  # Validations
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES }
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }

  before_save :calculate_total

  private

  def calculate_total
    self.total_amount = price * quantity
  end
end
