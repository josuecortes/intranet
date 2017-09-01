require 'test_helper'

class RequestDestiniesControllerTest < ActionController::TestCase
  setup do
    @request_destiny = request_destinies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_destinies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_destiny" do
    assert_difference('RequestDestiny.count') do
      post :create, request_destiny: { destiny_id: @request_destiny.destiny_id, request_id: @request_destiny.request_id }
    end

    assert_redirected_to request_destiny_path(assigns(:request_destiny))
  end

  test "should show request_destiny" do
    get :show, id: @request_destiny
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_destiny
    assert_response :success
  end

  test "should update request_destiny" do
    patch :update, id: @request_destiny, request_destiny: { destiny_id: @request_destiny.destiny_id, request_id: @request_destiny.request_id }
    assert_redirected_to request_destiny_path(assigns(:request_destiny))
  end

  test "should destroy request_destiny" do
    assert_difference('RequestDestiny.count', -1) do
      delete :destroy, id: @request_destiny
    end

    assert_redirected_to request_destinies_path
  end
end
