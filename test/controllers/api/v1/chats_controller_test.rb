require "test_helper"

class Api::V1::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_chats_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_chats_show_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_chats_update_url
    assert_response :success
  end
end
