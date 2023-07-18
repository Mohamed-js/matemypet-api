require "application_system_test_case"

class DislikesTest < ApplicationSystemTestCase
  setup do
    @dislike = dislikes(:one)
  end

  test "visiting the index" do
    visit dislikes_url
    assert_selector "h1", text: "Dislikes"
  end

  test "should create dislike" do
    visit dislikes_url
    click_on "New dislike"

    fill_in "Disliked animal", with: @dislike.disliked_animal_id
    fill_in "Disliker animal", with: @dislike.disliker_animal_id
    fill_in "Disliker user", with: @dislike.disliker_user_id
    click_on "Create Dislike"

    assert_text "Dislike was successfully created"
    click_on "Back"
  end

  test "should update Dislike" do
    visit dislike_url(@dislike)
    click_on "Edit this dislike", match: :first

    fill_in "Disliked animal", with: @dislike.disliked_animal_id
    fill_in "Disliker animal", with: @dislike.disliker_animal_id
    fill_in "Disliker user", with: @dislike.disliker_user_id
    click_on "Update Dislike"

    assert_text "Dislike was successfully updated"
    click_on "Back"
  end

  test "should destroy Dislike" do
    visit dislike_url(@dislike)
    click_on "Destroy this dislike", match: :first

    assert_text "Dislike was successfully destroyed"
  end
end
