class Transaction < ApplicationRecord
  # save a transaction total so that the budget can see how much is left to save
  # before_save do
    # self.transaction_total =
      # # Transaction.where(budget_id: @budget.map(&:id)).sum(:transaction_amount)
      # Transaction.sum(:transaction_amount)
  # end
  belongs_to :budget
  default_scope -> { order(created_at: :desc) }
  validates :budget_id, presence: true
  attr_accessor :transaction_amount

  def current_budget
    self.budget_id
  end
end
