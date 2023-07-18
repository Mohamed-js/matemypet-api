require "application_system_test_case"

class TiersTest < ApplicationSystemTestCase
  setup do
    @tier = tiers(:one)
  end

  test "visiting the index" do
    visit tiers_url
    assert_selector "h1", text: "Tiers"
  end

  test "should create tier" do
    visit tiers_url
    click_on "New tier"

    check "Ads" if @tier.ads
    check "Has unlimited likes" if @tier.has_unlimited_likes
    fill_in "Likes", with: @tier.likes
    fill_in "Max file size", with: @tier.max_file_size
    fill_in "Name", with: @tier.name
    fill_in "Pets", with: @tier.pets
    click_on "Create Tier"

    assert_text "Tier was successfully created"
    click_on "Back"
  end

  test "should update Tier" do
    visit tier_url(@tier)
    click_on "Edit this tier", match: :first

    check "Ads" if @tier.ads
    check "Has unlimited likes" if @tier.has_unlimited_likes
    fill_in "Likes", with: @tier.likes
    fill_in "Max file size", with: @tier.max_file_size
    fill_in "Name", with: @tier.name
    fill_in "Pets", with: @tier.pets
    click_on "Update Tier"

    assert_text "Tier was successfully updated"
    click_on "Back"
  end

  test "should destroy Tier" do
    visit tier_url(@tier)
    click_on "Destroy this tier", match: :first

    assert_text "Tier was successfully destroyed"
  end
end
