require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  def setup
    @budget = Budget.new(name: 'Test Budget', goal_total: 100.00, goal_date: 1/1/2018)
  end

  test 'should be valid' do
    assert @budget.valid?
    # debugger
  end

  # test 'name should be present' do
    # @budget.name = '   '
    # assert_not @budget.valid?
  # end
#
  # test 'name should be unique' do
    # duplicate_budget = @budget.dup
    # assert_not duplicate_budget.valid?
  # end

  # test 'name should be present' do
    # @budget.name = '   '
    # debugger
    # assert_not @budget.valid?
  # end
#
  # test 'name should be unique' do
    # duplicate_budget = @budget.dup
    # assert_not duplicate_budget.valid?
  # end
#
  # test "goal date shouldn't accept non-dates" do
    # @budget.goal_date = 1/1/1/2001
    # assert_not @budget.valid?
  # end

#test "goal date shouldn't accept past dates" do
  #@budget.goal_date = 1/1/2001
  #assert_not @budget.valid?
#end

 #test "goal total should round to 2 digits" do
 #end

 #test "goal total shouldn't accept invalid totals" do
 #end

 #test "goal total should accept valid totals" do
 #end

end
