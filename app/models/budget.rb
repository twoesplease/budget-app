class Budget < ApplicationRecord
  before_save { self.name = name.downcase }  
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  # validates :goal_date, presence: true,
                        # date: { after: proc { Date.today }, message:
                                # 'Must be a valid & future date' }
  # validates :goal_total, presence: true # , format:
  
  def transactions
    Transaction.where("budget_id = ?", id)
  end
end
