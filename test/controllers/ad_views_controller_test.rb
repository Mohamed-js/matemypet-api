require "test_helper"

class AdViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ad_view = ad_views(:one)
  end

  test "should get index" do
    get ad_views_url
    assert_response :success
  end

  test "should get new" do
    get new_ad_view_url
    assert_response :success
  end

  test "should create ad_view" do
    assert_difference("AdView.count") do
      post ad_views_url, params: { ad_view: { ad_id: @ad_view.ad_id, city: @ad_view.city, country: @ad_view.country, is_liked: @ad_view.is_liked, latitude: @ad_view.latitude, longitude: @ad_view.longitude, user_id: @ad_view.user_id } }
    end

    assert_redirected_to ad_view_url(AdView.last)
  end

  test "should show ad_view" do
    get ad_view_url(@ad_view)
    assert_response :success
  end

  test "should get edit" do
    get edit_ad_view_url(@ad_view)
    assert_response :success
  end

  test "should update ad_view" do
    patch ad_view_url(@ad_view), params: { ad_view: { ad_id: @ad_view.ad_id, city: @ad_view.city, country: @ad_view.country, is_liked: @ad_view.is_liked, latitude: @ad_view.latitude, longitude: @ad_view.longitude, user_id: @ad_view.user_id } }
    assert_redirected_to ad_view_url(@ad_view)
  end

  test "should destroy ad_view" do
    assert_difference("AdView.count", -1) do
      delete ad_view_url(@ad_view)
    end

    assert_redirected_to ad_views_url
  end
end
