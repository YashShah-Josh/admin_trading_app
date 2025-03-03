# == Schema Information
#
# Table name: transactions
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  transaction_type :string           default("buy"), not null
#  price            :decimal(15, 2)
#  quantity         :integer
#  total_amount     :decimal(15, 2)
#  executed_at      :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  order_id         :integer
#
class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :order

  TRANSACTION_TYPES = %w[buy sell].freeze

  # Validations
  # validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES }
  # validates :price, numericality: { greater_than: 0 }
  # validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  # validates :total_amount, numericality: { greater_than_or_equal_to: 0 }

  # before_save :calculate_total

  private

  def calculate_total
    self.total_amount = price * quantity
  end
end
