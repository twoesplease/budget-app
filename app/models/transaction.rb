class Transaction < ApplicationRecord
  # save a transaction total so that the budget can see how much is left to save
  # before_save do
    # self.transaction_total =
      # # Transaction.where(budget_id: @budget.map(&:id)).sum(:transaction_amount)
      # Transaction.sum(:transaction_amount)
  # end
  belongs_to :budget
  attr_accessor :transaction_amount
end
