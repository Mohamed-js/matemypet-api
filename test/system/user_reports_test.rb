require "application_system_test_case"

class UserReportsTest < ApplicationSystemTestCase
  setup do
    @user_report = user_reports(:one)
  end

  test "visiting the index" do
    visit user_reports_url
    assert_selector "h1", text: "User reports"
  end

  test "should create user report" do
    visit user_reports_url
    click_on "New user report"

    fill_in "Body", with: @user_report.body
    fill_in "Image", with: @user_report.image
    check "Read" if @user_report.read
    fill_in "Reported", with: @user_report.reported_id
    fill_in "Reported type", with: @user_report.reported_type
    fill_in "User", with: @user_report.user_id
    click_on "Create User report"

    assert_text "User report was successfully created"
    click_on "Back"
  end

  test "should update User report" do
    visit user_report_url(@user_report)
    click_on "Edit this user report", match: :first

    fill_in "Body", with: @user_report.body
    fill_in "Image", with: @user_report.image
    check "Read" if @user_report.read
    fill_in "Reported", with: @user_report.reported_id
    fill_in "Reported type", with: @user_report.reported_type
    fill_in "User", with: @user_report.user_id
    click_on "Update User report"

    assert_text "User report was successfully updated"
    click_on "Back"
  end

  test "should destroy User report" do
    visit user_report_url(@user_report)
    click_on "Destroy this user report", match: :first

    assert_text "User report was successfully destroyed"
  end
end
