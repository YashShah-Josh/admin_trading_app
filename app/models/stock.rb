# == Schema Information
#
# Table name: stocks
#
#  id            :integer          not null, primary key
#  symbol        :string
#  company_name  :string
#  current_price :float            default(0.0)
#  price_change  :float            default(0.0)
#  is_active     :boolean          default(TRUE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Stock < ApplicationRecord
  # Associations
  has_many :orders
  # has_many :transactions

  # Validations
  validates :symbol, presence: true, uniqueness: true
  validates :company_name, presence: true
  validates :current_price, numericality: { greater_than_or_equal_to: 0 }
  validates :price_change, numericality: true
end
