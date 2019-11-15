require "application_system_test_case"

class CoverImgsTest < ApplicationSystemTestCase
  setup do
    @cover_img = cover_imgs(:one)
  end

  test "visiting the index" do
    visit cover_imgs_url
    assert_selector "h1", text: "Cover Imgs"
  end

  test "creating a Cover img" do
    visit cover_imgs_url
    click_on "New Cover Img"

    fill_in "Comic", with: @cover_img.comic_id
    fill_in "Cover img", with: @cover_img.cover_img
    click_on "Create Cover img"

    assert_text "Cover img was successfully created"
    click_on "Back"
  end

  test "updating a Cover img" do
    visit cover_imgs_url
    click_on "Edit", match: :first

    fill_in "Comic", with: @cover_img.comic_id
    fill_in "Cover img", with: @cover_img.cover_img
    click_on "Update Cover img"

    assert_text "Cover img was successfully updated"
    click_on "Back"
  end

  test "destroying a Cover img" do
    visit cover_imgs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cover img was successfully destroyed"
  end
end
