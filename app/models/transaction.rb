class Transaction < ApplicationRecord
  # save a transaction total so that the budget can see how much is left to save
  before_save { self.transaction_total = self.sum(:transaction_amount) }
  belongs_to :budget
end
