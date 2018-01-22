require 'test_helper'

class SitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sit = sits(:one)
  end

  test "should get index" do
    get sits_url
    assert_response :success
  end

  test "should get new" do
    get new_sit_url
    assert_response :success
  end

  test "should create sit" do
    assert_difference('Sit.count') do
      post sits_url, params: { sit: { bus_id: @sit.bus_id, number: @sit.number, occupied: @sit.occupied } }
    end

    assert_redirected_to sit_url(Sit.last)
  end

  test "should show sit" do
    get sit_url(@sit)
    assert_response :success
  end

  test "should get edit" do
    get edit_sit_url(@sit)
    assert_response :success
  end

  test "should update sit" do
    patch sit_url(@sit), params: { sit: { bus_id: @sit.bus_id, number: @sit.number, occupied: @sit.occupied } }
    assert_redirected_to sit_url(@sit)
  end

  test "should destroy sit" do
    assert_difference('Sit.count', -1) do
      delete sit_url(@sit)
    end

    assert_redirected_to sits_url
  end
end
