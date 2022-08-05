require "application_system_test_case"

class ProductwatchersTest < ApplicationSystemTestCase
  setup do
    @productwatcher = productwatchers(:one)
  end

  test "visiting the index" do
    visit productwatchers_url
    assert_selector "h1", text: "Productwatchers"
  end

  test "should create productwatcher" do
    visit productwatchers_url
    click_on "New productwatcher"

    fill_in "Status", with: @productwatcher.status
    click_on "Create Productwatcher"

    assert_text "Productwatcher was successfully created"
    click_on "Back"
  end

  test "should update Productwatcher" do
    visit productwatcher_url(@productwatcher)
    click_on "Edit this productwatcher", match: :first

    fill_in "Status", with: @productwatcher.status
    click_on "Update Productwatcher"

    assert_text "Productwatcher was successfully updated"
    click_on "Back"
  end

  test "should destroy Productwatcher" do
    visit productwatcher_url(@productwatcher)
    click_on "Destroy this productwatcher", match: :first

    assert_text "Productwatcher was successfully destroyed"
  end
end
