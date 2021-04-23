require "test_helper"

class UserTest < ActiveSupport::TestCase 

    test "is nameable" do
        test = User.new
        test.name = "John Smith"
        assert_equal test.name, "John Smith"
    end

end