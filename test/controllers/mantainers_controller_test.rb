require "test_helper"

class MantainersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mantainer = mantainers(:one)
  end

  test "should get index" do
    get mantainers_url
    assert_response :success
  end

  test "should get new" do
    get new_mantainer_url
    assert_response :success
  end

  test "should create mantainer" do
    assert_difference("Mantainer.count") do
      post mantainers_url, params: { mantainer: { city: @mantainer.city, material: @mantainer.material, name: @mantainer.name, type_equipment: @mantainer.type_equipment, type_support: @mantainer.type_support } }
    end

    assert_redirected_to mantainer_url(Mantainer.last)
  end

  test "should show mantainer" do
    get mantainer_url(@mantainer)
    assert_response :success
  end

  test "should get edit" do
    get edit_mantainer_url(@mantainer)
    assert_response :success
  end

  test "should update mantainer" do
    patch mantainer_url(@mantainer), params: { mantainer: { city: @mantainer.city, material: @mantainer.material, name: @mantainer.name, type_equipment: @mantainer.type_equipment, type_support: @mantainer.type_support } }
    assert_redirected_to mantainer_url(@mantainer)
  end

  test "should destroy mantainer" do
    assert_difference("Mantainer.count", -1) do
      delete mantainer_url(@mantainer)
    end

    assert_redirected_to mantainers_url
  end
end
