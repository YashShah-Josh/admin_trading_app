# == Schema Information
#
# Table name: user_stocks
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  stock_id        :integer          not null
#  quantity        :integer          default(0), not null
#  purchased_price :float            default(0.0)
#  current_price   :float            default(0.0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class UserStock < ApplicationRecord
  belongs_to :user
	belongs_to :stock
end
