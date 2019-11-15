require 'test_helper'

class ComicTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comic_tag = comic_tags(:one)
  end

  test "should get index" do
    get comic_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_comic_tag_url
    assert_response :success
  end

  test "should create comic_tag" do
    assert_difference('ComicTag.count') do
      post comic_tags_url, params: { comic_tag: { comic_id: @comic_tag.comic_id, tag_id: @comic_tag.tag_id } }
    end

    assert_redirected_to comic_tag_url(ComicTag.last)
  end

  test "should show comic_tag" do
    get comic_tag_url(@comic_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_comic_tag_url(@comic_tag)
    assert_response :success
  end

  test "should update comic_tag" do
    patch comic_tag_url(@comic_tag), params: { comic_tag: { comic_id: @comic_tag.comic_id, tag_id: @comic_tag.tag_id } }
    assert_redirected_to comic_tag_url(@comic_tag)
  end

  test "should destroy comic_tag" do
    assert_difference('ComicTag.count', -1) do
      delete comic_tag_url(@comic_tag)
    end

    assert_redirected_to comic_tags_url
  end
end
