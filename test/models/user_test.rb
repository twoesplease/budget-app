require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Test User", email: "testuser@testdomain.com", 
                     password: "mY*t3$tP@55w3RD", password_confirmation: "mY*t3$tP@55w3RD")
  end

    test "user should be valid" do
      assert @user.valid?
    end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

    # test "name should not be too long" do
     #  @user.name = "a" * 51
     # assert_not @user.valid?
    # end

   test "name should not be too long" do
      @user.name = "a" * 51
     assert_not @user.valid?
   end

    # TODO : add tests for name length, email length, valid email addresses, & invalid email addresses
    
end
