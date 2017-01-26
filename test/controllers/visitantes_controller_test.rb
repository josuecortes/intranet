require 'test_helper'

class VisitantesControllerTest < ActionController::TestCase
  setup do
    @visitante = visitantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visitantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visitante" do
    assert_difference('Visitante.count') do
      post :create, visitante: { cpf: @visitante.cpf, nome: @visitante.nome, rg: @visitante.rg }
    end

    assert_redirected_to visitante_path(assigns(:visitante))
  end

  test "should show visitante" do
    get :show, id: @visitante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visitante
    assert_response :success
  end

  test "should update visitante" do
    patch :update, id: @visitante, visitante: { cpf: @visitante.cpf, nome: @visitante.nome, rg: @visitante.rg }
    assert_redirected_to visitante_path(assigns(:visitante))
  end

  test "should destroy visitante" do
    assert_difference('Visitante.count', -1) do
      delete :destroy, id: @visitante
    end

    assert_redirected_to visitantes_path
  end
end
