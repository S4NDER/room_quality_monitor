require 'test_helper'

class LuminositiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @luminosity = luminosities(:one)
  end

  test "should get index" do
    get luminosities_url
    assert_response :success
  end

  test "should get new" do
    get new_luminosity_url
    assert_response :success
  end

  test "should create luminosity" do
    assert_difference('Luminosity.count') do
      post luminosities_url, params: { luminosity: { value: @luminosity.value } }
    end

    assert_redirected_to luminosity_url(Luminosity.last)
  end

  test "should show luminosity" do
    get luminosity_url(@luminosity)
    assert_response :success
  end

  test "should get edit" do
    get edit_luminosity_url(@luminosity)
    assert_response :success
  end

  test "should update luminosity" do
    patch luminosity_url(@luminosity), params: { luminosity: { value: @luminosity.value } }
    assert_redirected_to luminosity_url(@luminosity)
  end

  test "should destroy luminosity" do
    assert_difference('Luminosity.count', -1) do
      delete luminosity_url(@luminosity)
    end

    assert_redirected_to luminosities_url
  end
end
