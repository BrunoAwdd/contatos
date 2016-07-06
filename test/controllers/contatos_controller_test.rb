require 'test_helper'

class ContatosControllerTest < ActionController::TestCase
  setup do
    @contato = contatos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contatos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contato" do
    assert_difference('Contato.count') do
      post :create, contato: { business_fone: @contato.business_fone, display_name: @contato.display_name, email2: @contato.email2, email: @contato.email, first_name: @contato.first_name, home_city: @contato.home_city, home_country: @contato.home_country, home_fone: @contato.home_fone, home_state: @contato.home_state, last_name: @contato.last_name, mobile_fone: @contato.mobile_fone, notes: @contato.notes, web_page: @contato.web_page }
    end

    assert_redirected_to contato_path(assigns(:contato))
  end

  test "should show contato" do
    get :show, id: @contato
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contato
    assert_response :success
  end

  test "should update contato" do
    patch :update, id: @contato, contato: { business_fone: @contato.business_fone, display_name: @contato.display_name, email2: @contato.email2, email: @contato.email, first_name: @contato.first_name, home_city: @contato.home_city, home_country: @contato.home_country, home_fone: @contato.home_fone, home_state: @contato.home_state, last_name: @contato.last_name, mobile_fone: @contato.mobile_fone, notes: @contato.notes, web_page: @contato.web_page }
    assert_redirected_to contato_path(assigns(:contato))
  end

  test "should destroy contato" do
    assert_difference('Contato.count', -1) do
      delete :destroy, id: @contato
    end

    assert_redirected_to contatos_path
  end
end
