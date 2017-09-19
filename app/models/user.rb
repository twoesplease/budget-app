class User < ApplicationRecord
  has_many :budgets, foreign_key: 'budget_id', dependent: :destroy
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  # source: Hartl Rails tutorial + a couple of my own tweaks
  VALID_EMAIL_REGEX = /\A[\w][\w\-\.\+]+@([\w\-]+\.)+[\w\-]{2,4}\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  has_secure_password
end
