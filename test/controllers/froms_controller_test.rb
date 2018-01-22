require 'test_helper'

class FromsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @from = froms(:one)
  end

  test "should get index" do
    get froms_url
    assert_response :success
  end

  test "should get new" do
    get new_from_url
    assert_response :success
  end

  test "should create from" do
    assert_difference('From.count') do
      post froms_url, params: { from: { name: @from.name } }
    end

    assert_redirected_to from_url(From.last)
  end

  test "should show from" do
    get from_url(@from)
    assert_response :success
  end

  test "should get edit" do
    get edit_from_url(@from)
    assert_response :success
  end

  test "should update from" do
    patch from_url(@from), params: { from: { name: @from.name } }
    assert_redirected_to from_url(@from)
  end

  test "should destroy from" do
    assert_difference('From.count', -1) do
      delete from_url(@from)
    end

    assert_redirected_to froms_url
  end
end
