require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "validates presence of first name" do
    user = build(:user, first_name: "")
    assert_not user.valid?
    assert_includes user.errors[:first_name], "can't be blank"
  end

  test "validates length of first name" do
    user = build(:user, first_name: "a" * 128)
    assert_not user.valid?
    assert_includes user.errors[:first_name], "is too long (maximum is 127 characters)"
  end

  test "validates length of last name" do
    user = build(:user, last_name: "a" * 128)
    assert_not user.valid?
    assert_includes user.errors[:last_name], "is too long (maximum is 127 characters)"
  end

  test "validates inclusion of time zone name" do
    user = build(:user, time_zone_name: "Invalid")
    assert_not user.valid?
    assert_includes user.errors[:time_zone_name], "is not included in the list"
  end

  test "name" do
    user = build(:user, first_name: "John", last_name: "Doe")
    assert_equal "John Doe", user.name
    assert_equal "John Doe", user.name.full
  end
end
