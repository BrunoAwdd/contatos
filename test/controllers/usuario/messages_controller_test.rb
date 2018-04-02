require 'test_helper'

class Usuario::MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usuario_message = usuario_messages(:one)
  end

  test "should get index" do
    get usuario_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_usuario_message_url
    assert_response :success
  end

  test "should create usuario_message" do
    assert_difference('Usuario::Message.count') do
      post usuario_messages_url, params: { usuario_message: { date: @usuario_message.date, message: @usuario_message.message, status: @usuario_message.status, user_id: @usuario_message.user_id } }
    end

    assert_redirected_to usuario_message_url(Usuario::Message.last)
  end

  test "should show usuario_message" do
    get usuario_message_url(@usuario_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_usuario_message_url(@usuario_message)
    assert_response :success
  end

  test "should update usuario_message" do
    patch usuario_message_url(@usuario_message), params: { usuario_message: { date: @usuario_message.date, message: @usuario_message.message, status: @usuario_message.status, user_id: @usuario_message.user_id } }
    assert_redirected_to usuario_message_url(@usuario_message)
  end

  test "should destroy usuario_message" do
    assert_difference('Usuario::Message.count', -1) do
      delete usuario_message_url(@usuario_message)
    end

    assert_redirected_to usuario_messages_url
  end
end
