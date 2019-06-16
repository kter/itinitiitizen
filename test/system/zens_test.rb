require "application_system_test_case"

class ZensTest < ApplicationSystemTestCase
  setup do
    @zen = zens(:one)
  end

  test "visiting the index" do
    visit zens_url
    assert_selector "h1", text: "Zens"
  end

  test "creating a Zen" do
    visit zens_url
    click_on "New Zen"

    fill_in "Content", with: @zen.content
    fill_in "Deleted", with: @zen.deleted
    click_on "Create Zen"

    assert_text "Zen was successfully created"
    click_on "Back"
  end

  test "updating a Zen" do
    visit zens_url
    click_on "Edit", match: :first

    fill_in "Content", with: @zen.content
    fill_in "Deleted", with: @zen.deleted
    click_on "Update Zen"

    assert_text "Zen was successfully updated"
    click_on "Back"
  end

  test "destroying a Zen" do
    visit zens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text t(:zen_destroyed)
  end
end
