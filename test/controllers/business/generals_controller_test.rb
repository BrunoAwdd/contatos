require 'test_helper'

class Business::GeneralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_general = business_generals(:one)
  end

  test "should get index" do
    get business_generals_url
    assert_response :success
  end

  test "should get new" do
    get new_business_general_url
    assert_response :success
  end

  test "should create business_general" do
    assert_difference('Business::General.count') do
      post business_generals_url, params: { business_general: { contact_id: @business_general.contact_id, date_entry: @business_general.date_entry, product_id: @business_general.product_id, subject: @business_general.subject } }
    end

    assert_redirected_to business_general_url(Business::General.last)
  end

  test "should show business_general" do
    get business_general_url(@business_general)
    assert_response :success
  end

  test "should get edit" do
    get edit_business_general_url(@business_general)
    assert_response :success
  end

  test "should update business_general" do
    patch business_general_url(@business_general), params: { business_general: { contact_id: @business_general.contact_id, date_entry: @business_general.date_entry, product_id: @business_general.product_id, subject: @business_general.subject } }
    assert_redirected_to business_general_url(@business_general)
  end

  test "should destroy business_general" do
    assert_difference('Business::General.count', -1) do
      delete business_general_url(@business_general)
    end

    assert_redirected_to business_generals_url
  end
end
