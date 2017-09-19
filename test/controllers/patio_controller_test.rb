require 'test_helper'

class PatioControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get entrada" do
    get :entrada
    assert_response :success
  end

  test "should get saida" do
    get :saida
    assert_response :success
  end

end
