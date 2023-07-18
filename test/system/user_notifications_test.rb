require "application_system_test_case"

class UserNotificationsTest < ApplicationSystemTestCase
  setup do
    @user_notification = user_notifications(:one)
  end

  test "visiting the index" do
    visit user_notifications_url
    assert_selector "h1", text: "User notifications"
  end

  test "should create user notification" do
    visit user_notifications_url
    click_on "New user notification"

    fill_in "Body", with: @user_notification.body
    fill_in "Image", with: @user_notification.image
    fill_in "Redirect to", with: @user_notification.redirect_to
    fill_in "Redirect to", with: @user_notification.redirect_to_id
    fill_in "Title", with: @user_notification.title
    fill_in "User", with: @user_notification.user_id
    click_on "Create User notification"

    assert_text "User notification was successfully created"
    click_on "Back"
  end

  test "should update User notification" do
    visit user_notification_url(@user_notification)
    click_on "Edit this user notification", match: :first

    fill_in "Body", with: @user_notification.body
    fill_in "Image", with: @user_notification.image
    fill_in "Redirect to", with: @user_notification.redirect_to
    fill_in "Redirect to", with: @user_notification.redirect_to_id
    fill_in "Title", with: @user_notification.title
    fill_in "User", with: @user_notification.user_id
    click_on "Update User notification"

    assert_text "User notification was successfully updated"
    click_on "Back"
  end

  test "should destroy User notification" do
    visit user_notification_url(@user_notification)
    click_on "Destroy this user notification", match: :first

    assert_text "User notification was successfully destroyed"
  end
end
