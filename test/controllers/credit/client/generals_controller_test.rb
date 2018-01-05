require 'test_helper'

class Credit::Client::GeneralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_client_general = credit_client_generals(:one)
  end

  test "should get index" do
    get credit_client_generals_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_client_general_url
    assert_response :success
  end

  test "should create credit_client_general" do
    assert_difference('Credit::Client::General.count') do
      post credit_client_generals_url, params: { credit_client_general: { brand: @credit_client_general.brand, cnpj: @credit_client_general.cnpj, contato: @credit_client_general.contato, name: @credit_client_general.name } }
    end

    assert_redirected_to credit_client_general_url(Credit::Client::General.last)
  end

  test "should show credit_client_general" do
    get credit_client_general_url(@credit_client_general)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_client_general_url(@credit_client_general)
    assert_response :success
  end

  test "should update credit_client_general" do
    patch credit_client_general_url(@credit_client_general), params: { credit_client_general: { brand: @credit_client_general.brand, cnpj: @credit_client_general.cnpj, contato: @credit_client_general.contato, name: @credit_client_general.name } }
    assert_redirected_to credit_client_general_url(@credit_client_general)
  end

  test "should destroy credit_client_general" do
    assert_difference('Credit::Client::General.count', -1) do
      delete credit_client_general_url(@credit_client_general)
    end

    assert_redirected_to credit_client_generals_url
  end
end
