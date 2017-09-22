require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  def setup
    User.create(id: 1, name: 'Tonee', email: 'itisi@toneeyoung.com',
                password: 'my_password')
    @budget = Budget.new(name: 'Test Budget', goal_total: 100.00,
                         goal_date: 1 / 1 / 2018, user_id: 1)
  end

  test 'should be valid' do
    assert @budget.valid?
  end

  test 'name should be present' do
    @budget.name = '   '
    assert_not @budget.valid?
  end

  test 'name should be unique' do
    duplicate_budget = @budget.dup
    duplicate_budget.name = @budget.name.upcase
    duplicate_budget.user_id = 2
    @budget.save
    assert_not duplicate_budget.valid?
  end

  test 'name should be saved as lower-case' do
    mixed_case_name = 'tEsT bUdGeT'
    @budget.name = mixed_case_name
    @budget.save
    assert_equal mixed_case_name.downcase, @budget.reload.name
  end

  test 'goal date shouldn\'t accept non-dates' do
    @budget.goal_date = 1 / 1 / 1 / 2001
    assert_not @budget.valid?
  end

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
