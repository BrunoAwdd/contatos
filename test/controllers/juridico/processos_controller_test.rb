require 'test_helper'

class Juridico::ProcessosControllerTest < ActionController::TestCase
  setup do
    @juridico_processo = juridico_processos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:juridico_processos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create juridico_processo" do
    assert_difference('Juridico::Processo.count') do
      post :create, juridico_processo: { author: @juridico_processo.author, circuit: @juridico_processo.circuit, date: @juridico_processo.date, defendant: @juridico_processo.defendant, notes: @juridico_processo.notes, number: @juridico_processo.number, shire: @juridico_processo.shire, type: @juridico_processo.type, value: @juridico_processo.value }
    end

    assert_redirected_to juridico_processo_path(assigns(:juridico_processo))
  end

  test "should show juridico_processo" do
    get :show, id: @juridico_processo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @juridico_processo
    assert_response :success
  end

  test "should update juridico_processo" do
    patch :update, id: @juridico_processo, juridico_processo: { author: @juridico_processo.author, circuit: @juridico_processo.circuit, date: @juridico_processo.date, defendant: @juridico_processo.defendant, notes: @juridico_processo.notes, number: @juridico_processo.number, shire: @juridico_processo.shire, type: @juridico_processo.type, value: @juridico_processo.value }
    assert_redirected_to juridico_processo_path(assigns(:juridico_processo))
  end

  test "should destroy juridico_processo" do
    assert_difference('Juridico::Processo.count', -1) do
      delete :destroy, id: @juridico_processo
    end

    assert_redirected_to juridico_processos_path
  end
end
