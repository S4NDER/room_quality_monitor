require 'test_helper'

class DevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @device = devices(:one)
  end

  test "should get index" do
    get devices_url
    assert_response :success
  end

  test "should get new" do
    get new_device_url
    assert_response :success
  end

  test "should create device" do
    assert_difference('Device.count') do
<<<<<<< HEAD
      post devices_url, params: { device: { audio: @device.audio, device_name: @device.device_name, humidity: @device.humidity, luminosity: @device.luminosity, temp: @device.temp } }
=======
      post devices_url, params: { device: { audio_id: @device.audio_id, humidity_id: @device.humidity_id, luminosity_id: @device.luminosity_id, temperature_id: @device.temperature_id } }
>>>>>>> ddea7d137107c64b126df3195f9f214696888600
    end

    assert_redirected_to device_url(Device.last)
  end

  test "should show device" do
    get device_url(@device)
    assert_response :success
  end

  test "should get edit" do
    get edit_device_url(@device)
    assert_response :success
  end

  test "should update device" do
<<<<<<< HEAD
    patch device_url(@device), params: { device: { audio: @device.audio, device_name: @device.device_name, humidity: @device.humidity, luminosity: @device.luminosity, temp: @device.temp } }
=======
    patch device_url(@device), params: { device: { audio_id: @device.audio_id, humidity_id: @device.humidity_id, luminosity_id: @device.luminosity_id, temperature_id: @device.temperature_id } }
>>>>>>> ddea7d137107c64b126df3195f9f214696888600
    assert_redirected_to device_url(@device)
  end

  test "should destroy device" do
    assert_difference('Device.count', -1) do
      delete device_url(@device)
    end

    assert_redirected_to devices_url
  end
end
