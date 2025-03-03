# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  role                   :string           default("admin")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           default("Admin"), not null
#
class Admin < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :confirmable

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  # Default Role
  before_create :set_default_role

  private

  def set_default_role
    self.role ||= "admin"
  end
end
