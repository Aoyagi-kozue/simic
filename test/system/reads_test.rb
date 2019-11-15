require "application_system_test_case"

class ReadsTest < ApplicationSystemTestCase
  setup do
    @read = reads(:one)
  end

  test "visiting the index" do
    visit reads_url
    assert_selector "h1", text: "Reads"
  end

  test "creating a Read" do
    visit reads_url
    click_on "New Read"

    fill_in "Comic", with: @read.comic_id
    fill_in "User", with: @read.user_id
    click_on "Create Read"

    assert_text "Read was successfully created"
    click_on "Back"
  end

  test "updating a Read" do
    visit reads_url
    click_on "Edit", match: :first

    fill_in "Comic", with: @read.comic_id
    fill_in "User", with: @read.user_id
    click_on "Update Read"

    assert_text "Read was successfully updated"
    click_on "Back"
  end

  test "destroying a Read" do
    visit reads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Read was successfully destroyed"
  end
end
