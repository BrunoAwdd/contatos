require 'test_helper'

class Usuario::GeneralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usuario_general = usuario_generals(:one)
  end

  test "should get index" do
    get usuario_generals_url
    assert_response :success
  end

  test "should get new" do
    get new_usuario_general_url
    assert_response :success
  end

  test "should create usuario_general" do
    assert_difference('Usuario::General.count') do
      post usuario_generals_url, params: { usuario_general: { last_name: @usuario_general.last_name, name: @usuario_general.name, user_id: @usuario_general.user_id } }
    end

    assert_redirected_to usuario_general_url(Usuario::General.last)
  end

  test "should show usuario_general" do
    get usuario_general_url(@usuario_general)
    assert_response :success
  end

  test "should get edit" do
    get edit_usuario_general_url(@usuario_general)
    assert_response :success
  end

  test "should update usuario_general" do
    patch usuario_general_url(@usuario_general), params: { usuario_general: { last_name: @usuario_general.last_name, name: @usuario_general.name, user_id: @usuario_general.user_id } }
    assert_redirected_to usuario_general_url(@usuario_general)
  end

  test "should destroy usuario_general" do
    assert_difference('Usuario::General.count', -1) do
      delete usuario_general_url(@usuario_general)
    end

    assert_redirected_to usuario_generals_url
  end
end
