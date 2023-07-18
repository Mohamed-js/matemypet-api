require "test_helper"

class Api::V1::QuotasControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_quotas_show_url
    assert_response :success
  end
end
