require 'test_helper'

class OrdemsControllerTest < ActionController::TestCase
  setup do
    @ordem = ordems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ordems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ordem" do
    assert_difference('Ordem.count') do
      post :create, ordem: { acoes: @ordem.acoes, cliente_id: @ordem.cliente_id, condicoes: @ordem.condicoes, conversa: @ordem.conversa, data_status_aberto: @ordem.data_status_aberto, data_status_aguardando: @ordem.data_status_aguardando, data_status_concluido: @ordem.data_status_concluido, data_status_em_atendimento: @ordem.data_status_em_atendimento, data_status_fechado: @ordem.data_status_fechado, departamento_id: @ordem.departamento_id, especificacoes: @ordem.especificacoes, problema: @ordem.problema, status: @ordem.status, tipo_equipamento: @ordem.tipo_equipamento, user_id: @ordem.user_id }
    end

    assert_redirected_to ordem_path(assigns(:ordem))
  end

  test "should show ordem" do
    get :show, id: @ordem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ordem
    assert_response :success
  end

  test "should update ordem" do
    patch :update, id: @ordem, ordem: { acoes: @ordem.acoes, cliente_id: @ordem.cliente_id, condicoes: @ordem.condicoes, conversa: @ordem.conversa, data_status_aberto: @ordem.data_status_aberto, data_status_aguardando: @ordem.data_status_aguardando, data_status_concluido: @ordem.data_status_concluido, data_status_em_atendimento: @ordem.data_status_em_atendimento, data_status_fechado: @ordem.data_status_fechado, departamento_id: @ordem.departamento_id, especificacoes: @ordem.especificacoes, problema: @ordem.problema, status: @ordem.status, tipo_equipamento: @ordem.tipo_equipamento, user_id: @ordem.user_id }
    assert_redirected_to ordem_path(assigns(:ordem))
  end

  test "should destroy ordem" do
    assert_difference('Ordem.count', -1) do
      delete :destroy, id: @ordem
    end

    assert_redirected_to ordems_path
  end
end
