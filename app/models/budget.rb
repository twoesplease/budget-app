class Budget < ApplicationRecord
   belongs_to :user
  # has_many :transactions

  validates :name, presence: true, uniqueness: true
  # validates :goal_date,
            # presence: true,
            # date: { after: proc { Date.today }, message:
                    # 'Must be a valid & future date' }
  # validates :goal_total, presence: true # , format:
end
