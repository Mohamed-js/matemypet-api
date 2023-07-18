require "test_helper"

class Api::V1::AdsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_ads_index_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_ads_update_url
    assert_response :success
  end
end
