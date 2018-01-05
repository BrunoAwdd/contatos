require 'test_helper'

class Business::HistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_history = business_histories(:one)
  end

  test "should get index" do
    get business_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_business_history_url
    assert_response :success
  end

  test "should create business_history" do
    assert_difference('Business::History.count') do
      post business_histories_url, params: { business_history: { business_general_id: @business_history.business_general_id, data_entry: @business_history.data_entry, note: @business_history.note } }
    end

    assert_redirected_to business_history_url(Business::History.last)
  end

  test "should show business_history" do
    get business_history_url(@business_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_business_history_url(@business_history)
    assert_response :success
  end

  test "should update business_history" do
    patch business_history_url(@business_history), params: { business_history: { business_general_id: @business_history.business_general_id, data_entry: @business_history.data_entry, note: @business_history.note } }
    assert_redirected_to business_history_url(@business_history)
  end

  test "should destroy business_history" do
    assert_difference('Business::History.count', -1) do
      delete business_history_url(@business_history)
    end

    assert_redirected_to business_histories_url
  end
end
