require 'test_helper'

class BarometersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barometer = barometers(:one)
  end

  test "should get index" do
    get barometers_url
    assert_response :success
  end

  test "should get new" do
    get new_barometer_url
    assert_response :success
  end

  test "should create barometer" do
    assert_difference('Barometer.count') do
      post barometers_url, params: { barometer: { value: @barometer.value } }
    end

    assert_redirected_to barometer_url(Barometer.last)
  end

  test "should show barometer" do
    get barometer_url(@barometer)
    assert_response :success
  end

  test "should get edit" do
    get edit_barometer_url(@barometer)
    assert_response :success
  end

  test "should update barometer" do
    patch barometer_url(@barometer), params: { barometer: { value: @barometer.value } }
    assert_redirected_to barometer_url(@barometer)
  end

  test "should destroy barometer" do
    assert_difference('Barometer.count', -1) do
      delete barometer_url(@barometer)
    end

    assert_redirected_to barometers_url
  end
end
