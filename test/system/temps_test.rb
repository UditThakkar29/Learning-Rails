require "application_system_test_case"

class TempsTest < ApplicationSystemTestCase
  setup do
    @temp = temps(:one)
  end

  test "visiting the index" do
    visit temps_url
    assert_selector "h1", text: "Temps"
  end

  test "should create temp" do
    visit temps_url
    click_on "New temp"

    fill_in "Email", with: @temp.email
    fill_in "Login", with: @temp.login
    fill_in "Name", with: @temp.name
    click_on "Create Temp"

    assert_text "Temp was successfully created"
    click_on "Back"
  end

  test "should update Temp" do
    visit temp_url(@temp)
    click_on "Edit this temp", match: :first

    fill_in "Email", with: @temp.email
    fill_in "Login", with: @temp.login
    fill_in "Name", with: @temp.name
    click_on "Update Temp"

    assert_text "Temp was successfully updated"
    click_on "Back"
  end

  test "should destroy Temp" do
    visit temp_url(@temp)
    click_on "Destroy this temp", match: :first

    assert_text "Temp was successfully destroyed"
  end
end
