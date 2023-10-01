require "application_system_test_case"

class MantainersTest < ApplicationSystemTestCase
  setup do
    @maintainer = maintainers(:one)
  end

  test "visiting the index" do
    visit mantainers_url
    assert_selector "h1", text: "Mantainers"
  end

  test "should create maintainer" do
    visit mantainers_url
    click_on "New maintainer"

    fill_in "City", with: @maintainer.city
    fill_in "Material", with: @maintainer.material
    fill_in "Name", with: @maintainer.name
    fill_in "Type equipment", with: @maintainer.type_equipment
    fill_in "Type support", with: @maintainer.type_support
    click_on "Create Mantainer"

    assert_text "Mantainer was successfully created"
    click_on "Back"
  end

  test "should update Mantainer" do
    visit mantainer_url(@maintainer)
    click_on "Edit this maintainer", match: :first

    fill_in "City", with: @maintainer.city
    fill_in "Material", with: @maintainer.material
    fill_in "Name", with: @maintainer.name
    fill_in "Type equipment", with: @maintainer.type_equipment
    fill_in "Type support", with: @maintainer.type_support
    click_on "Update Mantainer"

    assert_text "Mantainer was successfully updated"
    click_on "Back"
  end

  test "should destroy Mantainer" do
    visit mantainer_url(@maintainer)
    click_on "Destroy this maintainer", match: :first

    assert_text "Mantainer was successfully destroyed"
  end
end
