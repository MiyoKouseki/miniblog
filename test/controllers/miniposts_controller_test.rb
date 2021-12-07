require 'test_helper'

class MinipostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minipost = miniposts(:one)
  end

  test "should get index" do
    get miniposts_url
    assert_response :success
  end

  test "should get new" do
    get new_minipost_url
    assert_response :success
  end

  test "should create minipost" do
    assert_difference('Minipost.count') do
      post miniposts_url, params: { minipost: { content: @minipost.content, datetime: @minipost.datetime } }
    end

    assert_redirected_to minipost_url(Minipost.last)
  end

  test "should show minipost" do
    get minipost_url(@minipost)
    assert_response :success
  end

  test "should get edit" do
    get edit_minipost_url(@minipost)
    assert_response :success
  end

  test "should update minipost" do
    patch minipost_url(@minipost), params: { minipost: { content: @minipost.content, datetime: @minipost.datetime } }
    assert_redirected_to minipost_url(@minipost)
  end

  test "should destroy minipost" do
    assert_difference('Minipost.count', -1) do
      delete minipost_url(@minipost)
    end

    assert_redirected_to miniposts_url
  end
end
