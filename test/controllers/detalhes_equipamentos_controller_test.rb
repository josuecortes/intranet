require 'test_helper'

class DetalhesEquipamentosControllerTest < ActionController::TestCase
  setup do
    @detalhes_equipamento = detalhes_equipamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalhes_equipamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalhes_equipamento" do
    assert_difference('DetalhesEquipamento.count') do
      post :create, detalhes_equipamento: { configuracao: @detalhes_equipamento.configuracao, modelo: @detalhes_equipamento.modelo }
    end

    assert_redirected_to detalhes_equipamento_path(assigns(:detalhes_equipamento))
  end

  test "should show detalhes_equipamento" do
    get :show, id: @detalhes_equipamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalhes_equipamento
    assert_response :success
  end

  test "should update detalhes_equipamento" do
    patch :update, id: @detalhes_equipamento, detalhes_equipamento: { configuracao: @detalhes_equipamento.configuracao, modelo: @detalhes_equipamento.modelo }
    assert_redirected_to detalhes_equipamento_path(assigns(:detalhes_equipamento))
  end

  test "should destroy detalhes_equipamento" do
    assert_difference('DetalhesEquipamento.count', -1) do
      delete :destroy, id: @detalhes_equipamento
    end

    assert_redirected_to detalhes_equipamentos_path
  end
end
