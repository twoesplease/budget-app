class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  has_secure_password
end
