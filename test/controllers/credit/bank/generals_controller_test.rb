require 'test_helper'

class Credit::Bank::GeneralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_bank_general = credit_bank_generals(:one)
  end

  test "should get index" do
    get credit_bank_generals_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_bank_general_url
    assert_response :success
  end

  test "should create credit_bank_general" do
    assert_difference('Credit::Bank::General.count') do
      post credit_bank_generals_url, params: { credit_bank_general: { agency: @credit_bank_general.agency, contato_id: @credit_bank_general.contato_id, name: @credit_bank_general.name } }
    end

    assert_redirected_to credit_bank_general_url(Credit::Bank::General.last)
  end

  test "should show credit_bank_general" do
    get credit_bank_general_url(@credit_bank_general)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_bank_general_url(@credit_bank_general)
    assert_response :success
  end

  test "should update credit_bank_general" do
    patch credit_bank_general_url(@credit_bank_general), params: { credit_bank_general: { agency: @credit_bank_general.agency, contato_id: @credit_bank_general.contato_id, name: @credit_bank_general.name } }
    assert_redirected_to credit_bank_general_url(@credit_bank_general)
  end

  test "should destroy credit_bank_general" do
    assert_difference('Credit::Bank::General.count', -1) do
      delete credit_bank_general_url(@credit_bank_general)
    end

    assert_redirected_to credit_bank_generals_url
  end
end
