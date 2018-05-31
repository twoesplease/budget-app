class User < ApplicationRecord
  has_many :budgets, foreign_key: 'budget_id', dependent: :destroy
  has_many :transactions, through: :budgets
  before_save { email.downcase! }
  before_create :set_slug
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w][\w\-\.\+]+@([\w\-]+\.)+[\w\-]{2,4}\z/i # source: Hartl Rails tutorial + a couple of my own tweaks
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  has_secure_password

  def budgets
    Budget.where("user_id = ?", id)
  end

  def to_param
    slug
  end

  private
    def set_slug
      loop do
        self.slug = SecureRandom.uuid
        break unless User.where(slug: slug).exists?
      end
    end
end
