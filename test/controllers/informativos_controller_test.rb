require 'test_helper'

class InformativosControllerTest < ActionController::TestCase
  setup do
    @informativo = informativos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:informativos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create informativo" do
    assert_difference('Informativo.count') do
      post :create, informativo: { informacoes: @informativo.informacoes, publicado: @informativo.publicado, tipo: @informativo.tipo, titulo: @informativo.titulo, user_id: @informativo.user_id }
    end

    assert_redirected_to informativo_path(assigns(:informativo))
  end

  test "should show informativo" do
    get :show, id: @informativo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @informativo
    assert_response :success
  end

  test "should update informativo" do
    patch :update, id: @informativo, informativo: { informacoes: @informativo.informacoes, publicado: @informativo.publicado, tipo: @informativo.tipo, titulo: @informativo.titulo, user_id: @informativo.user_id }
    assert_redirected_to informativo_path(assigns(:informativo))
  end

  test "should destroy informativo" do
    assert_difference('Informativo.count', -1) do
      delete :destroy, id: @informativo
    end

    assert_redirected_to informativos_path
  end
end
