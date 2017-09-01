require 'test_helper'

class RequestPassengersControllerTest < ActionController::TestCase
  setup do
    @request_passenger = request_passengers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_passengers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_passenger" do
    assert_difference('RequestPassenger.count') do
      post :create, request_passenger: { passenger_id: @request_passenger.passenger_id, request_id: @request_passenger.request_id }
    end

    assert_redirected_to request_passenger_path(assigns(:request_passenger))
  end

  test "should show request_passenger" do
    get :show, id: @request_passenger
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_passenger
    assert_response :success
  end

  test "should update request_passenger" do
    patch :update, id: @request_passenger, request_passenger: { passenger_id: @request_passenger.passenger_id, request_id: @request_passenger.request_id }
    assert_redirected_to request_passenger_path(assigns(:request_passenger))
  end

  test "should destroy request_passenger" do
    assert_difference('RequestPassenger.count', -1) do
      delete :destroy, id: @request_passenger
    end

    assert_redirected_to request_passengers_path
  end
end
