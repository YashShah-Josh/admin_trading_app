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
