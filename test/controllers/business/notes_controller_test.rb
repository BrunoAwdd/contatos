require 'test_helper'

class Business::NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_note = business_notes(:one)
  end

  test "should get index" do
    get business_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_business_note_url
    assert_response :success
  end

  test "should create business_note" do
    assert_difference('Business::Note.count') do
      post business_notes_url, params: { business_note: { business_general_id: @business_note.business_general_id, note: @business_note.note } }
    end

    assert_redirected_to business_note_url(Business::Note.last)
  end

  test "should show business_note" do
    get business_note_url(@business_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_business_note_url(@business_note)
    assert_response :success
  end

  test "should update business_note" do
    patch business_note_url(@business_note), params: { business_note: { business_general_id: @business_note.business_general_id, note: @business_note.note } }
    assert_redirected_to business_note_url(@business_note)
  end

  test "should destroy business_note" do
    assert_difference('Business::Note.count', -1) do
      delete business_note_url(@business_note)
    end

    assert_redirected_to business_notes_url
  end
end
