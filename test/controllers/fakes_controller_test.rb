require 'test_helper'

class FakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fake = fakes(:one)
  end

  test "should get index" do
    get fakes_url
    assert_response :success
  end

  test "should get new" do
    get new_fake_url
    assert_response :success
  end

  test "should create fake" do
    assert_difference('Fake.count') do
      post fakes_url, params: { fake: {  } }
    end

    assert_redirected_to fake_url(Fake.last)
  end

  test "should show fake" do
    get fake_url(@fake)
    assert_response :success
  end

  test "should get edit" do
    get edit_fake_url(@fake)
    assert_response :success
  end

  test "should update fake" do
    patch fake_url(@fake), params: { fake: {  } }
    assert_redirected_to fake_url(@fake)
  end

  test "should destroy fake" do
    assert_difference('Fake.count', -1) do
      delete fake_url(@fake)
    end

    assert_redirected_to fakes_url
  end
end
