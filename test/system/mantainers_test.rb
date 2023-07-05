require "application_system_test_case"

class MantainersTest < ApplicationSystemTestCase
  setup do
    @mantainer = mantainers(:one)
  end

  test "visiting the index" do
    visit mantainers_url
    assert_selector "h1", text: "Mantainers"
  end

  test "should create mantainer" do
    visit mantainers_url
    click_on "New mantainer"

    fill_in "City", with: @mantainer.city
    fill_in "Material", with: @mantainer.material
    fill_in "Name", with: @mantainer.name
    fill_in "Type equipment", with: @mantainer.type_equipment
    fill_in "Type support", with: @mantainer.type_support
    click_on "Create Mantainer"

    assert_text "Mantainer was successfully created"
    click_on "Back"
  end

  test "should update Mantainer" do
    visit mantainer_url(@mantainer)
    click_on "Edit this mantainer", match: :first

    fill_in "City", with: @mantainer.city
    fill_in "Material", with: @mantainer.material
    fill_in "Name", with: @mantainer.name
    fill_in "Type equipment", with: @mantainer.type_equipment
    fill_in "Type support", with: @mantainer.type_support
    click_on "Update Mantainer"

    assert_text "Mantainer was successfully updated"
    click_on "Back"
  end

  test "should destroy Mantainer" do
    visit mantainer_url(@mantainer)
    click_on "Destroy this mantainer", match: :first

    assert_text "Mantainer was successfully destroyed"
  end
end
