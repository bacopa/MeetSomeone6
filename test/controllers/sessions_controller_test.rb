require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get join" do
    get :join
    assert_response :success
  end

  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get activity" do
    get :activity
    assert_response :success
  end

end
