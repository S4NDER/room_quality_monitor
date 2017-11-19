require 'test_helper'

class ChartByDeviceTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chart_by_device_type = chart_by_device_types(:one)
  end

  test "should get index" do
    get chart_by_device_types_url
    assert_response :success
  end

  test "should get new" do
    get new_chart_by_device_type_url
    assert_response :success
  end

  test "should create chart_by_device_type" do
    assert_difference('ChartByDeviceType.count') do
      post chart_by_device_types_url, params: { chart_by_device_type: {  } }
    end

    assert_redirected_to chart_by_device_type_url(ChartByDeviceType.last)
  end

  test "should show chart_by_device_type" do
    get chart_by_device_type_url(@chart_by_device_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_chart_by_device_type_url(@chart_by_device_type)
    assert_response :success
  end

  test "should update chart_by_device_type" do
    patch chart_by_device_type_url(@chart_by_device_type), params: { chart_by_device_type: {  } }
    assert_redirected_to chart_by_device_type_url(@chart_by_device_type)
  end

  test "should destroy chart_by_device_type" do
    assert_difference('ChartByDeviceType.count', -1) do
      delete chart_by_device_type_url(@chart_by_device_type)
    end

    assert_redirected_to chart_by_device_types_url
  end
end
