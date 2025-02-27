class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :validatable, :confirmable

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :role, presence: true, inclusion: { in: %w[admin superadmin] }
end
