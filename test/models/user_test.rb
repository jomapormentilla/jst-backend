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

    test "requires password" do
        test_user = User.new(name: "John Smith")
        assert_not test_user.valid?
    end

    test "email is invalid when non-unique" do
      User.create(name: "John Smith", email: "john@gmail.com", password: "Password123")
      test_user = User.new(name: "John Smith", email: "john@gmail.com", password: "Password123")
      assert_not test_user.valid?
    end

end