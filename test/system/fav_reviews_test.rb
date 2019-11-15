require "application_system_test_case"

class FavReviewsTest < ApplicationSystemTestCase
  setup do
    @fav_review = fav_reviews(:one)
  end

  test "visiting the index" do
    visit fav_reviews_url
    assert_selector "h1", text: "Fav Reviews"
  end

  test "creating a Fav review" do
    visit fav_reviews_url
    click_on "New Fav Review"

    fill_in "Review", with: @fav_review.review_id
    fill_in "User", with: @fav_review.user_id
    click_on "Create Fav review"

    assert_text "Fav review was successfully created"
    click_on "Back"
  end

  test "updating a Fav review" do
    visit fav_reviews_url
    click_on "Edit", match: :first

    fill_in "Review", with: @fav_review.review_id
    fill_in "User", with: @fav_review.user_id
    click_on "Update Fav review"

    assert_text "Fav review was successfully updated"
    click_on "Back"
  end

  test "destroying a Fav review" do
    visit fav_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fav review was successfully destroyed"
  end
end
