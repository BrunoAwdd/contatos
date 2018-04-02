require 'test_helper'

class Credit::Client::Partner::BasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_client_partner_basis = credit_client_partner_bases(:one)
  end

  test "should get index" do
    get credit_client_partner_bases_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_client_partner_basis_url
    assert_response :success
  end

  test "should create credit_client_partner_basis" do
    assert_difference('Credit::Client::Partner::Base.count') do
      post credit_client_partner_bases_url, params: { credit_client_partner_basis: { credit_client_general_id: @credit_client_partner_basis.credit_client_general_id, name: @credit_client_partner_basis.name } }
    end

    assert_redirected_to credit_client_partner_basis_url(Credit::Client::Partner::Base.last)
  end

  test "should show credit_client_partner_basis" do
    get credit_client_partner_basis_url(@credit_client_partner_basis)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_client_partner_basis_url(@credit_client_partner_basis)
    assert_response :success
  end

  test "should update credit_client_partner_basis" do
    patch credit_client_partner_basis_url(@credit_client_partner_basis), params: { credit_client_partner_basis: { credit_client_general_id: @credit_client_partner_basis.credit_client_general_id, name: @credit_client_partner_basis.name } }
    assert_redirected_to credit_client_partner_basis_url(@credit_client_partner_basis)
  end

  test "should destroy credit_client_partner_basis" do
    assert_difference('Credit::Client::Partner::Base.count', -1) do
      delete credit_client_partner_basis_url(@credit_client_partner_basis)
    end

    assert_redirected_to credit_client_partner_bases_url
  end
end
