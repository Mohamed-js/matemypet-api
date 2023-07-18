require "test_helper"

class TiersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tier = tiers(:one)
  end

  test "should get index" do
    get tiers_url
    assert_response :success
  end

  test "should get new" do
    get new_tier_url
    assert_response :success
  end

  test "should create tier" do
    assert_difference("Tier.count") do
      post tiers_url, params: { tier: { ads: @tier.ads, has_unlimited_likes: @tier.has_unlimited_likes, likes: @tier.likes, max_file_size: @tier.max_file_size, name: @tier.name, pets: @tier.pets } }
    end

    assert_redirected_to tier_url(Tier.last)
  end

  test "should show tier" do
    get tier_url(@tier)
    assert_response :success
  end

  test "should get edit" do
    get edit_tier_url(@tier)
    assert_response :success
  end

  test "should update tier" do
    patch tier_url(@tier), params: { tier: { ads: @tier.ads, has_unlimited_likes: @tier.has_unlimited_likes, likes: @tier.likes, max_file_size: @tier.max_file_size, name: @tier.name, pets: @tier.pets } }
    assert_redirected_to tier_url(@tier)
  end

  test "should destroy tier" do
    assert_difference("Tier.count", -1) do
      delete tier_url(@tier)
    end

    assert_redirected_to tiers_url
  end
end
