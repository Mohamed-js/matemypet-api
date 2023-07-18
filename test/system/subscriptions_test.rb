require "application_system_test_case"

class SubscriptionsTest < ApplicationSystemTestCase
  setup do
    @subscription = subscriptions(:one)
  end

  test "visiting the index" do
    visit subscriptions_url
    assert_selector "h1", text: "Subscriptions"
  end

  test "should create subscription" do
    visit subscriptions_url
    click_on "New subscription"

    check "Ads" if @subscription.ads
    check "Has unlimited likes" if @subscription.has_unlimited_likes
    fill_in "Likes", with: @subscription.likes
    fill_in "Max file size", with: @subscription.max_file_size
    fill_in "Pets", with: @subscription.pets
    fill_in "Tier", with: @subscription.tier_id
    fill_in "User", with: @subscription.user_id
    click_on "Create Subscription"

    assert_text "Subscription was successfully created"
    click_on "Back"
  end

  test "should update Subscription" do
    visit subscription_url(@subscription)
    click_on "Edit this subscription", match: :first

    check "Ads" if @subscription.ads
    check "Has unlimited likes" if @subscription.has_unlimited_likes
    fill_in "Likes", with: @subscription.likes
    fill_in "Max file size", with: @subscription.max_file_size
    fill_in "Pets", with: @subscription.pets
    fill_in "Tier", with: @subscription.tier_id
    fill_in "User", with: @subscription.user_id
    click_on "Update Subscription"

    assert_text "Subscription was successfully updated"
    click_on "Back"
  end

  test "should destroy Subscription" do
    visit subscription_url(@subscription)
    click_on "Destroy this subscription", match: :first

    assert_text "Subscription was successfully destroyed"
  end
end
