require "application_system_test_case"

class QuotaTest < ApplicationSystemTestCase
  setup do
    @quotum = quota(:one)
  end

  test "visiting the index" do
    visit quota_url
    assert_selector "h1", text: "Quota"
  end

  test "should create quotum" do
    visit quota_url
    click_on "New quotum"

    fill_in "First like date", with: @quotum.first_like_date
    check "Has unlimited likes" if @quotum.has_unlimited_likes
    fill_in "Likes", with: @quotum.likes
    check "Likes updated" if @quotum.likes_updated
    fill_in "Max file size", with: @quotum.max_file_size
    fill_in "Pets", with: @quotum.pets
    fill_in "Subscription", with: @quotum.subscription_id
    fill_in "User", with: @quotum.user_id
    click_on "Create Quotum"

    assert_text "Quotum was successfully created"
    click_on "Back"
  end

  test "should update Quotum" do
    visit quotum_url(@quotum)
    click_on "Edit this quotum", match: :first

    fill_in "First like date", with: @quotum.first_like_date
    check "Has unlimited likes" if @quotum.has_unlimited_likes
    fill_in "Likes", with: @quotum.likes
    check "Likes updated" if @quotum.likes_updated
    fill_in "Max file size", with: @quotum.max_file_size
    fill_in "Pets", with: @quotum.pets
    fill_in "Subscription", with: @quotum.subscription_id
    fill_in "User", with: @quotum.user_id
    click_on "Update Quotum"

    assert_text "Quotum was successfully updated"
    click_on "Back"
  end

  test "should destroy Quotum" do
    visit quotum_url(@quotum)
    click_on "Destroy this quotum", match: :first

    assert_text "Quotum was successfully destroyed"
  end
end
