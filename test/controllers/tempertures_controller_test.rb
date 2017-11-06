require 'test_helper'

class TemperturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temperture = tempertures(:one)
  end

  test "should get index" do
    get tempertures_url
    assert_response :success
  end

  test "should get new" do
    get new_temperture_url
    assert_response :success
  end

  test "should create temperture" do
    assert_difference('Temperture.count') do
      post tempertures_url, params: { temperture: { value: @temperture.value } }
    end

    assert_redirected_to temperture_url(Temperture.last)
  end

  test "should show temperture" do
    get temperture_url(@temperture)
    assert_response :success
  end

  test "should get edit" do
    get edit_temperture_url(@temperture)
    assert_response :success
  end

  test "should update temperture" do
    patch temperture_url(@temperture), params: { temperture: { value: @temperture.value } }
    assert_redirected_to temperture_url(@temperture)
  end

  test "should destroy temperture" do
    assert_difference('Temperture.count', -1) do
      delete temperture_url(@temperture)
    end

    assert_redirected_to tempertures_url
  end
end
