require 'test_helper'

class Credit::DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_document = credit_documents(:one)
  end

  test "should get index" do
    get credit_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_document_url
    assert_response :success
  end

  test "should create credit_document" do
    assert_difference('Credit::Document.count') do
      post credit_documents_url, params: { credit_document: { frequency_number: @credit_document.frequency_number, frequency_unity: @credit_document.frequency_unity, name: @credit_document.name } }
    end

    assert_redirected_to credit_document_url(Credit::Document.last)
  end

  test "should show credit_document" do
    get credit_document_url(@credit_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_document_url(@credit_document)
    assert_response :success
  end

  test "should update credit_document" do
    patch credit_document_url(@credit_document), params: { credit_document: { frequency_number: @credit_document.frequency_number, frequency_unity: @credit_document.frequency_unity, name: @credit_document.name } }
    assert_redirected_to credit_document_url(@credit_document)
  end

  test "should destroy credit_document" do
    assert_difference('Credit::Document.count', -1) do
      delete credit_document_url(@credit_document)
    end

    assert_redirected_to credit_documents_url
  end
end
