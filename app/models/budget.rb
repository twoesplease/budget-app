class Budget < ApplicationRecord
  before_save { self.goal_total.round(2) }
  belongs_to :user
  has_many :transactions
  validates :name, presence: true,  uniqueness: true
  validates :goal_date, presence: true, numericality: true,
            message: 'Must be a valid & future date' 
  # validates :goal_total, presence: true, format:
end
