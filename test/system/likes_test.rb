require "application_system_test_case"

class LikesTest < ApplicationSystemTestCase
  setup do
    @like = likes(:one)
  end

  test "visiting the index" do
    visit likes_url
    assert_selector "h1", text: "Likes"
  end

  test "should create like" do
    visit likes_url
    click_on "New like"

    check "Is liked back" if @like.is_liked_back
    fill_in "Liked animal", with: @like.liked_animal_id
    fill_in "Liked user", with: @like.liked_user_id
    fill_in "Liker animal", with: @like.liker_animal_id
    fill_in "Liker user", with: @like.liker_user_id
    click_on "Create Like"

    assert_text "Like was successfully created"
    click_on "Back"
  end

  test "should update Like" do
    visit like_url(@like)
    click_on "Edit this like", match: :first

    check "Is liked back" if @like.is_liked_back
    fill_in "Liked animal", with: @like.liked_animal_id
    fill_in "Liked user", with: @like.liked_user_id
    fill_in "Liker animal", with: @like.liker_animal_id
    fill_in "Liker user", with: @like.liker_user_id
    click_on "Update Like"

    assert_text "Like was successfully updated"
    click_on "Back"
  end

  test "should destroy Like" do
    visit like_url(@like)
    click_on "Destroy this like", match: :first

    assert_text "Like was successfully destroyed"
  end
end
