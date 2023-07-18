require "test_helper"

class QuotaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quotum = quota(:one)
  end

  test "should get index" do
    get quota_url
    assert_response :success
  end

  test "should get new" do
    get new_quotum_url
    assert_response :success
  end

  test "should create quotum" do
    assert_difference("Quotum.count") do
      post quota_url, params: { quotum: { first_like_date: @quotum.first_like_date, has_unlimited_likes: @quotum.has_unlimited_likes, likes: @quotum.likes, likes_updated: @quotum.likes_updated, max_file_size: @quotum.max_file_size, pets: @quotum.pets, subscription_id: @quotum.subscription_id, user_id: @quotum.user_id } }
    end

    assert_redirected_to quotum_url(Quotum.last)
  end

  test "should show quotum" do
    get quotum_url(@quotum)
    assert_response :success
  end

  test "should get edit" do
    get edit_quotum_url(@quotum)
    assert_response :success
  end

  test "should update quotum" do
    patch quotum_url(@quotum), params: { quotum: { first_like_date: @quotum.first_like_date, has_unlimited_likes: @quotum.has_unlimited_likes, likes: @quotum.likes, likes_updated: @quotum.likes_updated, max_file_size: @quotum.max_file_size, pets: @quotum.pets, subscription_id: @quotum.subscription_id, user_id: @quotum.user_id } }
    assert_redirected_to quotum_url(@quotum)
  end

  test "should destroy quotum" do
    assert_difference("Quotum.count", -1) do
      delete quotum_url(@quotum)
    end

    assert_redirected_to quota_url
  end
end
