require 'test_helper'

class CoverImgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cover_img = cover_imgs(:one)
  end

  test "should get index" do
    get cover_imgs_url
    assert_response :success
  end

  test "should get new" do
    get new_cover_img_url
    assert_response :success
  end

  test "should create cover_img" do
    assert_difference('CoverImg.count') do
      post cover_imgs_url, params: { cover_img: { comic_id: @cover_img.comic_id, cover_img: @cover_img.cover_img } }
    end

    assert_redirected_to cover_img_url(CoverImg.last)
  end

  test "should show cover_img" do
    get cover_img_url(@cover_img)
    assert_response :success
  end

  test "should get edit" do
    get edit_cover_img_url(@cover_img)
    assert_response :success
  end

  test "should update cover_img" do
    patch cover_img_url(@cover_img), params: { cover_img: { comic_id: @cover_img.comic_id, cover_img: @cover_img.cover_img } }
    assert_redirected_to cover_img_url(@cover_img)
  end

  test "should destroy cover_img" do
    assert_difference('CoverImg.count', -1) do
      delete cover_img_url(@cover_img)
    end

    assert_redirected_to cover_imgs_url
  end
end
