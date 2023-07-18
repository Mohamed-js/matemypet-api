require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:one)
  end

  test "should get index" do
    get likes_url
    assert_response :success
  end

  test "should get new" do
    get new_like_url
    assert_response :success
  end

  test "should create like" do
    assert_difference("Like.count") do
      post likes_url, params: { like: { is_liked_back: @like.is_liked_back, liked_animal_id: @like.liked_animal_id, liked_user_id: @like.liked_user_id, liker_animal_id: @like.liker_animal_id, liker_user_id: @like.liker_user_id } }
    end

    assert_redirected_to like_url(Like.last)
  end

  test "should show like" do
    get like_url(@like)
    assert_response :success
  end

  test "should get edit" do
    get edit_like_url(@like)
    assert_response :success
  end

  test "should update like" do
    patch like_url(@like), params: { like: { is_liked_back: @like.is_liked_back, liked_animal_id: @like.liked_animal_id, liked_user_id: @like.liked_user_id, liker_animal_id: @like.liker_animal_id, liker_user_id: @like.liker_user_id } }
    assert_redirected_to like_url(@like)
  end

  test "should destroy like" do
    assert_difference("Like.count", -1) do
      delete like_url(@like)
    end

    assert_redirected_to likes_url
  end
end
