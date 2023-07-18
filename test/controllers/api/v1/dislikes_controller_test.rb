require "test_helper"

class Api::V1::DislikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_dislikes_create_url
    assert_response :success
  end
end
