require 'test_helper'

class BuskingsControllerTest < ActionController::TestCase
  setup do
    @busking = buskings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buskings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create busking" do
    assert_difference('Busking.count') do
      post :create, busking: { content: @busking.content, day: @busking.day, image: @busking.image, name: @busking.name, place: @busking.place }
    end

    assert_redirected_to busking_path(assigns(:busking))
  end

  test "should show busking" do
    get :show, id: @busking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @busking
    assert_response :success
  end

  test "should update busking" do
    patch :update, id: @busking, busking: { content: @busking.content, day: @busking.day, image: @busking.image, name: @busking.name, place: @busking.place }
    assert_redirected_to busking_path(assigns(:busking))
  end

  test "should destroy busking" do
    assert_difference('Busking.count', -1) do
      delete :destroy, id: @busking
    end

    assert_redirected_to buskings_path
  end
end
