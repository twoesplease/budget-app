require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Test User', email: 'testuser@testdomain.com',
                     password: 'mY*t3$tP@55w3RD',
                     password_confirmation: 'mY*t3$tP@55w3RD')
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '     '
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '    '
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = 'a' * 255 + '@domain.com'
    assert_not @user.valid?
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[valid@example.com valid_address@example.org
                         val.id@example.com val+id@example.COM
                         VALID_again@example.org vAlId_AdDrEsS@example.cc
                         valid-address@EXAMPLE.com]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[invalid@ invalid_address@example+another.com
                           -invalid@example.com .invalid@example.org
                           invalid@example,org invalid@example i@d.org
                           invalid@example_com invalid_at_example.com]
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, '#{address.inspect} should be invalid'
    end
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'password should not be blank' do
    @user.password = @user.password_confirmation = '    ' * 6
    assert_not @user.valid?
  end

  test 'password should not be too short' do
    @user.password = @user.password_confirmation = 'a' * 7
    assert_not @user.valid?
  end
end
