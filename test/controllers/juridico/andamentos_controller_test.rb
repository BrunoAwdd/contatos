require 'test_helper'

class Juridico::AndamentosControllerTest < ActionController::TestCase
  setup do
    @juridico_andamento = juridico_andamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:juridico_andamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create juridico_andamento" do
    assert_difference('Juridico::Andamento.count') do
      post :create, juridico_andamento: { data: @juridico_andamento.data, nota: @juridico_andamento.nota, processo_id: @juridico_andamento.processo_id }
    end

    assert_redirected_to juridico_andamento_path(assigns(:juridico_andamento))
  end

  test "should show juridico_andamento" do
    get :show, id: @juridico_andamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @juridico_andamento
    assert_response :success
  end

  test "should update juridico_andamento" do
    patch :update, id: @juridico_andamento, juridico_andamento: { data: @juridico_andamento.data, nota: @juridico_andamento.nota, processo_id: @juridico_andamento.processo_id }
    assert_redirected_to juridico_andamento_path(assigns(:juridico_andamento))
  end

  test "should destroy juridico_andamento" do
    assert_difference('Juridico::Andamento.count', -1) do
      delete :destroy, id: @juridico_andamento
    end

    assert_redirected_to juridico_andamentos_path
  end
end
