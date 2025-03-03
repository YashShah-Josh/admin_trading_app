# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Devise Authentication
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  # Associations
  has_many :orders
  has_many :transactions
  has_many :user_stocks

  # Validations
  # validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :pan, presence: true, uniqueness: true, length: { is: 10 }, format: { with: /\A[A-Z]{5}[0-9]{4}[A-Z]{1}\z/, message: "must be a valid PAN format" }
  # validates :phone, presence: true, length: { is: 10 }, numericality: { only_integer: true }
  # validates :balance, numericality: { greater_than_or_equal_to: 0 }

  # Soft Delete Scope
  scope :active, -> { where(deleted_at: nil) }
end
