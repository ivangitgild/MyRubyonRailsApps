require 'test_helper'

class AdminusersControllerTest < ActionController::TestCase
  setup do
    @adminuser = adminusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adminusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adminuser" do
    assert_difference('Adminuser.count') do
      post :create, adminuser: @adminuser.attributes
    end

    assert_redirected_to adminuser_path(assigns(:adminuser))
  end

  test "should show adminuser" do
    get :show, id: @adminuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adminuser
    assert_response :success
  end

  test "should update adminuser" do
    put :update, id: @adminuser, adminuser: @adminuser.attributes
    assert_redirected_to adminuser_path(assigns(:adminuser))
  end

  test "should destroy adminuser" do
    assert_difference('Adminuser.count', -1) do
      delete :destroy, id: @adminuser
    end

    assert_redirected_to adminusers_path
  end
end
