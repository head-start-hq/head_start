require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @params = {name: "John Doe", email: "example@example.com", password: "LJn!!oHNW7Bl^l96", time_zone_offset: "19800"}
  end

  test "sets the user's time_zone_name based on the time_zone_offset" do
    assert_difference "User.count" do
      post user_registration_path, params: {user: @params}
    end
    user = User.last
    assert_equal "Chennai", user.time_zone_name
  end

  test "does not set the user's time_zone_name if the time_zone_offset is invalid" do
    assert_difference "User.count" do
      post user_registration_path, params: {user: @params.merge(time_zone_offset: "100")}
    end
    user = User.last
    assert_equal "UTC", user.time_zone_name
  end

  test "does not set the user's time_zone_name if time_zone_offset is not present" do
    assert_difference "User.count" do
      post user_registration_path, params: {user: @params.except(:time_zone_offset)}
    end
    user = User.last
    assert_equal "UTC", user.time_zone_name
  end
end
