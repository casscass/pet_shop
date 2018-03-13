require 'test_helper'

class TribblesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tribble = tribbles(:one)
  end

  test "should get index" do
    get tribbles_url
    assert_response :success
  end

  test "should get new" do
    get new_tribble_url
    assert_response :success
  end

  test "should create tribble" do
    assert_difference('Tribble.count') do
      post tribbles_url, params: { tribble: { colour: @tribble.colour, quantity: @tribble.quantity, spaceship: @tribble.spaceship } }
    end

    assert_redirected_to tribble_url(Tribble.last)
  end

  test "should show tribble" do
    get tribble_url(@tribble)
    assert_response :success
  end

  test "should get edit" do
    get edit_tribble_url(@tribble)
    assert_response :success
  end

  test "should update tribble" do
    patch tribble_url(@tribble), params: { tribble: { colour: @tribble.colour, quantity: @tribble.quantity, spaceship: @tribble.spaceship } }
    assert_redirected_to tribble_url(@tribble)
  end

  test "should destroy tribble" do
    assert_difference('Tribble.count', -1) do
      delete tribble_url(@tribble)
    end

    assert_redirected_to tribbles_url
  end
end
