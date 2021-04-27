require "test_helper"

class UserTest < ActiveSupport::TestCase 

    test "is nameable" do
        test_user = User.new
        test_user.name = "John Smith"
        assert_equal test_user.name, "John Smith"
    end

    test "requires username" do
        test_user = User.new(password: "Password123")
        assert_not test_user.valid?
    end

    test "requires password but not password confirmation" do
        test_user = User.new(name: "John Smith")
        assert_not test_user.valid?
    end

    test "requires password to match password confirmation" do
        test_user = User.new(name: "John Smith")
        test_user.password = 'foo'
        test_user.password_confirmation = 'fo0'
        assert_not test_user.valid?
    end

    test "defaults account_type to graduate" do
        test_user = User.new(name: "John Smith", email: "john@gmail.com", password: "Password123")
        assert_equal test_user.account_type "graduate"
    end

    test "account_type must be one of admin, graduate, career_coach" do
        test_user = User.new(name: "John Smith", email: "john@gmail.com", password: "Password123", account_type: "Test")
        assert_not test_user.valid?
    end

    test "email is invalid when non-unique" do
        User.create(name: "John Smith", email: "john@gmail.com", password: "Password123")
        test_user = User.new(name: "John Smith", email: "john@gmail.com", password: "Password123")
        assert_not test_user.valid?
    end

    test "has many weeks" do
        test_user = User.create(name: "John Smith", email: "john1@gmail.com", password: "Password123")
        test_week = User.weeks.build
        assert_equal test_week test_user.weeks[0]
    end

    test "has MBG_valid? function to return boolean value" do
        assert User.all[0].methods.include?(:MBG_valid?)
    end

end