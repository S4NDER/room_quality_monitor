require 'test_helper'

class HumiditiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @humidity = humidities(:one)
  end

  test "should get index" do
    get humidities_url
    assert_response :success
  end

  test "should get new" do
    get new_humidity_url
    assert_response :success
  end

  test "should create humidity" do
    assert_difference('Humidity.count') do
      post humidities_url, params: { humidity: { value: @humidity.value } }
    end

    assert_redirected_to humidity_url(Humidity.last)
  end

  test "should show humidity" do
    get humidity_url(@humidity)
    assert_response :success
  end

  test "should get edit" do
    get edit_humidity_url(@humidity)
    assert_response :success
  end

  test "should update humidity" do
    patch humidity_url(@humidity), params: { humidity: { value: @humidity.value } }
    assert_redirected_to humidity_url(@humidity)
  end

  test "should destroy humidity" do
    assert_difference('Humidity.count', -1) do
      delete humidity_url(@humidity)
    end

    assert_redirected_to humidities_url
  end
end
