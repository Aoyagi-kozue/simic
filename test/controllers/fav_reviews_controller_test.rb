require 'test_helper'

class FavReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fav_review = fav_reviews(:one)
  end

  test "should get index" do
    get fav_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_fav_review_url
    assert_response :success
  end

  test "should create fav_review" do
    assert_difference('FavReview.count') do
      post fav_reviews_url, params: { fav_review: { review_id: @fav_review.review_id, user_id: @fav_review.user_id } }
    end

    assert_redirected_to fav_review_url(FavReview.last)
  end

  test "should show fav_review" do
    get fav_review_url(@fav_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_fav_review_url(@fav_review)
    assert_response :success
  end

  test "should update fav_review" do
    patch fav_review_url(@fav_review), params: { fav_review: { review_id: @fav_review.review_id, user_id: @fav_review.user_id } }
    assert_redirected_to fav_review_url(@fav_review)
  end

  test "should destroy fav_review" do
    assert_difference('FavReview.count', -1) do
      delete fav_review_url(@fav_review)
    end

    assert_redirected_to fav_reviews_url
  end
end
