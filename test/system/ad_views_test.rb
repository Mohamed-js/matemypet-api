require "application_system_test_case"

class AdViewsTest < ApplicationSystemTestCase
  setup do
    @ad_view = ad_views(:one)
  end

  test "visiting the index" do
    visit ad_views_url
    assert_selector "h1", text: "Ad views"
  end

  test "should create ad view" do
    visit ad_views_url
    click_on "New ad view"

    fill_in "Ad", with: @ad_view.ad_id
    fill_in "City", with: @ad_view.city
    fill_in "Country", with: @ad_view.country
    check "Is liked" if @ad_view.is_liked
    fill_in "Latitude", with: @ad_view.latitude
    fill_in "Longitude", with: @ad_view.longitude
    fill_in "User", with: @ad_view.user_id
    click_on "Create Ad view"

    assert_text "Ad view was successfully created"
    click_on "Back"
  end

  test "should update Ad view" do
    visit ad_view_url(@ad_view)
    click_on "Edit this ad view", match: :first

    fill_in "Ad", with: @ad_view.ad_id
    fill_in "City", with: @ad_view.city
    fill_in "Country", with: @ad_view.country
    check "Is liked" if @ad_view.is_liked
    fill_in "Latitude", with: @ad_view.latitude
    fill_in "Longitude", with: @ad_view.longitude
    fill_in "User", with: @ad_view.user_id
    click_on "Update Ad view"

    assert_text "Ad view was successfully updated"
    click_on "Back"
  end

  test "should destroy Ad view" do
    visit ad_view_url(@ad_view)
    click_on "Destroy this ad view", match: :first

    assert_text "Ad view was successfully destroyed"
  end
end
