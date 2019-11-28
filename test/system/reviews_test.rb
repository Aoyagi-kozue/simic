require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @review = reviews(:one)
  end

  test "visiting the index" do
    visit reviews_url
    assert_selector "h1", text: "Reviews"
  end

  test "creating a Review" do
    visit reviews_url
    click_on "New Review"

    fill_in "Comic", with: @review.comic_id
    fill_in "Netabare", with: @review.netabare
    fill_in "Review text", with: @review.review_text
    fill_in "Review title", with: @review.review_title
    fill_in "User", with: @review.user_id
    click_on "Create Review"

    assert_text "Review was successfully created"
    click_on "Back"
  end

  test "updating a Review" do
    visit reviews_url
    click_on "Edit", match: :first

    fill_in "Comic", with: @review.comic_id
    fill_in "Netabare", with: @review.netabare
    fill_in "Review text", with: @review.review_text
    fill_in "Review title", with: @review.review_title
    fill_in "User", with: @review.user_id
    click_on "Update Review"

    assert_text "Review was successfully updated"
    click_on "Back"
  end

  test "destroying a Review" do
    visit reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review was successfully destroyed"
  end
end
