require "test_helper"

class UserTest < ActiveSupport::TestCase 

    test "is nameable" do
        test_user = User.new
        test_user.name = "John Smith"
        assert_equal test_user.name, "John Smith"
    end

    test "requires username" do
        test_user = User.new
        assert_not test_user.valid?
    end

    test "requires password" do
        test_user = User.new(name: "John Smith")
        assert_not test_user.valid?
    end

end