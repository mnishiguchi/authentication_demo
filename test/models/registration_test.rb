require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase

  def setup
    # create a registration in memory.
    @registration = Registration.new(
                      registrable: User.new,
                      email:    "registration@example.com",
                      password: "password",
                      password_confirmation: "password")
  end

  test "should be valid" do
    assert @registration.valid?
  end


  # ---
  # Registration Email
  # ---


  test "email should be present" do
    blank_email = "    "
    @registration.email = blank_email
    assert_not @registration.valid?
  end

  test "email should not be too long" do
    invalid_email = "a" * 244 + "@example.com"  # max: 255
    @registration.email = invalid_email
    assert_not @registration.valid?
  end

  test "email validation should accept valid addresses" do
    # Email format validation is tricky and error-prone
    # make sure valid addressed are accepted while invalid ones are rejected
    valid_addresses = %w(user@example.com
                        USER@foo.COM
                        A_US-ER@foo.bar.org
                        first.last@foo.jp
                        alice+bob@baz.cn)
    valid_addresses.each do |valid_address|
      @registration.email = valid_address
      # display specific address that failed in case of error
      assert @registration.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w(user@example,com
                          user_at_foo.org
                          user.name@example.
                          foo@bar_baz.com
                          foo@bar+baz.com
                          foo@bar..com)
    invalid_addresses.each do |invalid_address|
      @registration.email = invalid_address
      # display specific address that failed in case of error
      assert_not @registration.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    @registration.save                        # @registration is saved to database
    duplicate_user = @registration.dup        # try to sign up with the same address
    duplicate_user.email = @registration.email.upcase  # check for case insensitivity
    assert_not duplicate_user.valid?  # should be rejected
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @registration.email = mixed_case_email
    @registration.save  # save @registration to database
    # reload @registration from database and verify email was converted to lowercase
    assert_equal mixed_case_email.downcase, @registration.reload.email
  end


  # ---
  # Registrations Password
  # ---


  test "password should have a minimum length" do
    invalid_password = "a" * 5
    @registration.password = @registration.password_confirmation = invalid_password
    assert_not @registration.valid?
  end

end
