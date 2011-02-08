require 'test_helper'

class PuppiesControllerTest < ActionController::TestCase
  setup do
    @puppy = puppies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:puppies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create puppy" do
    assert_difference('Puppy.count') do
      post :create, :puppy => @puppy.attributes
    end

    assert_redirected_to puppy_path(assigns(:puppy))
  end

  test "should show puppy" do
    get :show, :id => @puppy.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @puppy.to_param
    assert_response :success
  end

  test "should update puppy" do
    put :update, :id => @puppy.to_param, :puppy => @puppy.attributes
    assert_redirected_to puppy_path(assigns(:puppy))
  end

  test "should destroy puppy" do
    assert_difference('Puppy.count', -1) do
      delete :destroy, :id => @puppy.to_param
    end

    assert_redirected_to puppies_path
  end
end
