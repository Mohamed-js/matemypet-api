require "test_helper"

class Api::V1::UserReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_user_reports_create_url
    assert_response :success
  end
end
