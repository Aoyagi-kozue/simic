require "application_system_test_case"

class ComicTagsTest < ApplicationSystemTestCase
  setup do
    @comic_tag = comic_tags(:one)
  end

  test "visiting the index" do
    visit comic_tags_url
    assert_selector "h1", text: "Comic Tags"
  end

  test "creating a Comic tag" do
    visit comic_tags_url
    click_on "New Comic Tag"

    fill_in "Comic", with: @comic_tag.comic_id
    fill_in "Tag", with: @comic_tag.tag_id
    click_on "Create Comic tag"

    assert_text "Comic tag was successfully created"
    click_on "Back"
  end

  test "updating a Comic tag" do
    visit comic_tags_url
    click_on "Edit", match: :first

    fill_in "Comic", with: @comic_tag.comic_id
    fill_in "Tag", with: @comic_tag.tag_id
    click_on "Update Comic tag"

    assert_text "Comic tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Comic tag" do
    visit comic_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comic tag was successfully destroyed"
  end
end
