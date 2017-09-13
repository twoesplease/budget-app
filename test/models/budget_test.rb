require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  def setup
    @budget = Budget.new(name: "Test Budget", goal_total: 100.00, goal_date: 1/1/2018)
  end

  test "should be valid" do
    assert @budget.valid?
  end

  test "name should be present" do
    @budget.name = "   "
    assert_not @budget.valid?
  end
end
