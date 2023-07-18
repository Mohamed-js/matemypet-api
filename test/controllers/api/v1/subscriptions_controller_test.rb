require "test_helper"

class Api::V1::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_subscriptions_show_url
    assert_response :success
  end
end
