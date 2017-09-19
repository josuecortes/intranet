require 'test_helper'

class VeiculosControllerTest < ActionController::TestCase
  setup do
    @veiculo = veiculos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:veiculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create veiculo" do
    assert_difference('Veiculo.count') do
      post :create, veiculo: { ano: @veiculo.ano, capacidade: @veiculo.capacidade, carga: @veiculo.carga, combustivel: @veiculo.combustivel, cor: @veiculo.cor, marca: @veiculo.marca, modelo: @veiculo.modelo, motorista_id: @veiculo.motorista_id, placa: @veiculo.placa, posto_id: @veiculo.posto_id, status: @veiculo.status, tipo: @veiculo.tipo, validade_documento: @veiculo.validade_documento }
    end

    assert_redirected_to veiculo_path(assigns(:veiculo))
  end

  test "should show veiculo" do
    get :show, id: @veiculo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @veiculo
    assert_response :success
  end

  test "should update veiculo" do
    patch :update, id: @veiculo, veiculo: { ano: @veiculo.ano, capacidade: @veiculo.capacidade, carga: @veiculo.carga, combustivel: @veiculo.combustivel, cor: @veiculo.cor, marca: @veiculo.marca, modelo: @veiculo.modelo, motorista_id: @veiculo.motorista_id, placa: @veiculo.placa, posto_id: @veiculo.posto_id, status: @veiculo.status, tipo: @veiculo.tipo, validade_documento: @veiculo.validade_documento }
    assert_redirected_to veiculo_path(assigns(:veiculo))
  end

  test "should destroy veiculo" do
    assert_difference('Veiculo.count', -1) do
      delete :destroy, id: @veiculo
    end

    assert_redirected_to veiculos_path
  end
end
