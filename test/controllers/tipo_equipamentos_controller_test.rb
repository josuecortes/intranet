require 'test_helper'

class TipoEquipamentosControllerTest < ActionController::TestCase
  setup do
    @tipo_equipamento = tipo_equipamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_equipamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_equipamento" do
    assert_difference('TipoEquipamento.count') do
      post :create, tipo_equipamento: { tipo: @tipo_equipamento.tipo }
    end

    assert_redirected_to tipo_equipamento_path(assigns(:tipo_equipamento))
  end

  test "should show tipo_equipamento" do
    get :show, id: @tipo_equipamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_equipamento
    assert_response :success
  end

  test "should update tipo_equipamento" do
    patch :update, id: @tipo_equipamento, tipo_equipamento: { tipo: @tipo_equipamento.tipo }
    assert_redirected_to tipo_equipamento_path(assigns(:tipo_equipamento))
  end

  test "should destroy tipo_equipamento" do
    assert_difference('TipoEquipamento.count', -1) do
      delete :destroy, id: @tipo_equipamento
    end

    assert_redirected_to tipo_equipamentos_path
  end
end
