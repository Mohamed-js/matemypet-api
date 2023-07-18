require "test_helper"

class Api::V1::PaymobTransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_paymob_transactions_create_url
    assert_response :success
  end
end
