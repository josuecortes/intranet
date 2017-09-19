require 'test_helper'

class PostosControllerTest < ActionController::TestCase
  setup do
    @posto = postos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create posto" do
    assert_difference('Posto.count') do
      post :create, posto: { codigo: @posto.codigo, kms_total: @posto.kms_total, kms_usado: @posto.kms_usado, status: @posto.status, tipo: @posto.tipo }
    end

    assert_redirected_to posto_path(assigns(:posto))
  end

  test "should show posto" do
    get :show, id: @posto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @posto
    assert_response :success
  end

  test "should update posto" do
    patch :update, id: @posto, posto: { codigo: @posto.codigo, kms_total: @posto.kms_total, kms_usado: @posto.kms_usado, status: @posto.status, tipo: @posto.tipo }
    assert_redirected_to posto_path(assigns(:posto))
  end

  test "should destroy posto" do
    assert_difference('Posto.count', -1) do
      delete :destroy, id: @posto
    end

    assert_redirected_to postos_path
  end
end
