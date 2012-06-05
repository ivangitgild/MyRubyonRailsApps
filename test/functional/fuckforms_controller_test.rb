require 'test_helper'

class FuckformsControllerTest < ActionController::TestCase
  setup do
    @fuckform = fuckforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fuckforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fuckform" do
    assert_difference('Fuckform.count') do
      post :create, fuckform: @fuckform.attributes
    end

    assert_redirected_to fuckform_path(assigns(:fuckform))
  end

  test "should show fuckform" do
    get :show, id: @fuckform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fuckform
    assert_response :success
  end

  test "should update fuckform" do
    put :update, id: @fuckform, fuckform: @fuckform.attributes
    assert_redirected_to fuckform_path(assigns(:fuckform))
  end

  test "should destroy fuckform" do
    assert_difference('Fuckform.count', -1) do
      delete :destroy, id: @fuckform
    end

    assert_redirected_to fuckforms_path
  end
end
