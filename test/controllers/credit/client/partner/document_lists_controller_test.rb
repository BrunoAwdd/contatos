require 'test_helper'

class Credit::Client::Partner::DocumentListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_client_partner_document_list = credit_client_partner_document_lists(:one)
  end

  test "should get index" do
    get credit_client_partner_document_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_client_partner_document_list_url
    assert_response :success
  end

  test "should create credit_client_partner_document_list" do
    assert_difference('Credit::Client::Partner::DocumentList.count') do
      post credit_client_partner_document_lists_url, params: { credit_client_partner_document_list: { frequency_number: @credit_client_partner_document_list.frequency_number, frequency_unity: @credit_client_partner_document_list.frequency_unity, name: @credit_client_partner_document_list.name } }
    end

    assert_redirected_to credit_client_partner_document_list_url(Credit::Client::Partner::DocumentList.last)
  end

  test "should show credit_client_partner_document_list" do
    get credit_client_partner_document_list_url(@credit_client_partner_document_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_client_partner_document_list_url(@credit_client_partner_document_list)
    assert_response :success
  end

  test "should update credit_client_partner_document_list" do
    patch credit_client_partner_document_list_url(@credit_client_partner_document_list), params: { credit_client_partner_document_list: { frequency_number: @credit_client_partner_document_list.frequency_number, frequency_unity: @credit_client_partner_document_list.frequency_unity, name: @credit_client_partner_document_list.name } }
    assert_redirected_to credit_client_partner_document_list_url(@credit_client_partner_document_list)
  end

  test "should destroy credit_client_partner_document_list" do
    assert_difference('Credit::Client::Partner::DocumentList.count', -1) do
      delete credit_client_partner_document_list_url(@credit_client_partner_document_list)
    end

    assert_redirected_to credit_client_partner_document_lists_url
  end
end
