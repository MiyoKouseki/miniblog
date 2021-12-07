require "application_system_test_case"

class MinipostsTest < ApplicationSystemTestCase
  setup do
    @minipost = miniposts(:one)
  end

  test "visiting the index" do
    visit miniposts_url
    assert_selector "h1", text: "Miniposts"
  end

  test "creating a Minipost" do
    visit miniposts_url
    click_on "New Minipost"

    fill_in "Content", with: @minipost.content
    fill_in "Datetime", with: @minipost.datetime
    fill_in "User", with: @minipost.user_id
    click_on "Create Minipost"

    assert_text "Minipost was successfully created"
    click_on "Back"
  end

  test "updating a Minipost" do
    visit miniposts_url
    click_on "Edit", match: :first

    fill_in "Content", with: @minipost.content
    fill_in "Datetime", with: @minipost.datetime
    fill_in "User", with: @minipost.user_id
    click_on "Update Minipost"

    assert_text "Minipost was successfully updated"
    click_on "Back"
  end

  test "destroying a Minipost" do
    visit miniposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Minipost was successfully destroyed"
  end
end
