class User < ApplicationRecord
  # Devise Authentication
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  # Associations
  has_many :orders
  has_many :transactions

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :pan, presence: true, uniqueness: true, length: { is: 10 }, format: { with: /\A[A-Z]{5}[0-9]{4}[A-Z]{1}\z/, message: "must be a valid PAN format" }
  validates :phone, presence: true, length: { is: 10 }, numericality: { only_integer: true }
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  # Soft Delete Scope
  scope :active, -> { where(deleted_at: nil) }
end
