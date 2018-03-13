require 'test_helper'

class SevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sevice = sevices(:one)
  end

  test "should get index" do
    get sevices_url
    assert_response :success
  end

  test "should get new" do
    get new_sevice_url
    assert_response :success
  end

  test "should create sevice" do
    assert_difference('Sevice.count') do
      post sevices_url, params: { sevice: { cost: @sevice.cost, name: @sevice.name, time: @sevice.time } }
    end

    assert_redirected_to sevice_url(Sevice.last)
  end

  test "should show sevice" do
    get sevice_url(@sevice)
    assert_response :success
  end

  test "should get edit" do
    get edit_sevice_url(@sevice)
    assert_response :success
  end

  test "should update sevice" do
    patch sevice_url(@sevice), params: { sevice: { cost: @sevice.cost, name: @sevice.name, time: @sevice.time } }
    assert_redirected_to sevice_url(@sevice)
  end

  test "should destroy sevice" do
    assert_difference('Sevice.count', -1) do
      delete sevice_url(@sevice)
    end

    assert_redirected_to sevices_url
  end
end
