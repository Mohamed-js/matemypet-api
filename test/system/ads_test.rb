require "application_system_test_case"

class AdsTest < ApplicationSystemTestCase
  setup do
    @ad = ads(:one)
  end

  test "visiting the index" do
    visit ads_url
    assert_selector "h1", text: "Ads"
  end

  test "should create ad" do
    visit ads_url
    click_on "New ad"

    fill_in "App appearance place", with: @ad.app_appearance_place
    fill_in "Caption", with: @ad.caption
    fill_in "Duration in days", with: @ad.duration_in_days
    fill_in "Image", with: @ad.image
    check "Is expired" if @ad.is_expired
    fill_in "Link to ad", with: @ad.link_to_ad
    fill_in "Owner", with: @ad.owner
    fill_in "Priority", with: @ad.priority
    fill_in "Views", with: @ad.views
    click_on "Create Ad"

    assert_text "Ad was successfully created"
    click_on "Back"
  end

  test "should update Ad" do
    visit ad_url(@ad)
    click_on "Edit this ad", match: :first

    fill_in "App appearance place", with: @ad.app_appearance_place
    fill_in "Caption", with: @ad.caption
    fill_in "Duration in days", with: @ad.duration_in_days
    fill_in "Image", with: @ad.image
    check "Is expired" if @ad.is_expired
    fill_in "Link to ad", with: @ad.link_to_ad
    fill_in "Owner", with: @ad.owner
    fill_in "Priority", with: @ad.priority
    fill_in "Views", with: @ad.views
    click_on "Update Ad"

    assert_text "Ad was successfully updated"
    click_on "Back"
  end

  test "should destroy Ad" do
    visit ad_url(@ad)
    click_on "Destroy this ad", match: :first

    assert_text "Ad was successfully destroyed"
  end
end