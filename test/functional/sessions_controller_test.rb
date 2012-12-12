require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    alice = users(:one)
    post :create, name: alice.name, password: 'letmein'
    assert_redirected_to admin_url
    assert_equal alice.id, session[:user_id]
  end

  test "should fail login" do
    alice = users(:one)
    post :create, name: alice.name, password: 'thisisnotmypassword'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to root_path
  end
end
