class User < ApplicationRecord
  has_secure_password

  has_many :orders, dependent: :nullify
  has_many :transactions, dependent: :nullify

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, uniqueness: true, length: { is: 10 }, numericality: { only_integer: true }
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

  scope :active, -> { where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.current)
  end

  def active?
    deleted_at.nil?
  end
end
