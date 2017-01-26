require 'test_helper'

class StatusEquipamentosControllerTest < ActionController::TestCase
  setup do
    @status_equipamento = status_equipamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_equipamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_equipamento" do
    assert_difference('StatusEquipamento.count') do
      post :create, status_equipamento: { status: @status_equipamento.status }
    end

    assert_redirected_to status_equipamento_path(assigns(:status_equipamento))
  end

  test "should show status_equipamento" do
    get :show, id: @status_equipamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status_equipamento
    assert_response :success
  end

  test "should update status_equipamento" do
    patch :update, id: @status_equipamento, status_equipamento: { status: @status_equipamento.status }
    assert_redirected_to status_equipamento_path(assigns(:status_equipamento))
  end

  test "should destroy status_equipamento" do
    assert_difference('StatusEquipamento.count', -1) do
      delete :destroy, id: @status_equipamento
    end

    assert_redirected_to status_equipamentos_path
  end
end
