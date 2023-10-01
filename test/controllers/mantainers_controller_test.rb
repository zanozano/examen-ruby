require "test_helper"

class MantainersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintainer = maintainers(:one)
  end

  test "should get index" do
    get mantainers_url
    assert_response :success
  end

  test "should get new" do
    get new_mantainer_url
    assert_response :success
  end

  test "should create maintainer" do
    assert_difference("Mantainer.count") do
      post mantainers_url, params: { maintainer: { city: @maintainer.city, material: @maintainer.material, name: @maintainer.name, type_equipment: @maintainer.type_equipment, type_support: @maintainer.type_support } }
    end

    assert_redirected_to mantainer_url(Mantainer.last)
  end

  test "should show maintainer" do
    get mantainer_url(@maintainer)
    assert_response :success
  end

  test "should get edit" do
    get edit_mantainer_url(@maintainer)
    assert_response :success
  end

  test "should update maintainer" do
    patch mantainer_url(@maintainer), params: { maintainer: { city: @maintainer.city, material: @maintainer.material, name: @maintainer.name, type_equipment: @maintainer.type_equipment, type_support: @maintainer.type_support } }
    assert_redirected_to mantainer_url(@maintainer)
  end

  test "should destroy maintainer" do
    assert_difference("Mantainer.count", -1) do
      delete mantainer_url(@maintainer)
    end

    assert_redirected_to mantainers_url
  end
end
