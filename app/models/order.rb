# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  stock_id   :integer          not null
#  order_type :string           default("buy"), not null
#  price      :float            default(0.0)
#  quantity   :integer
#  status     :string           default("pending")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Order < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  # Order types
  # ORDER_TYPES = %w[buy sell].freeze
  STATUS_TYPES = %w[pending completed cancelled].freeze

  # Validations
  # validates :order_type, presence: true, inclusion: { in: ORDER_TYPES }
  validates :status, presence: true, inclusion: { in: STATUS_TYPES }
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
