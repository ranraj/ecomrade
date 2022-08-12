# frozen_string_literal: true

require 'test_helper'

class PurchaseordersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @purchaseorder = purchaseorders(:one)
  end

  test 'should get index' do
    sign_in users(:one)
    get purchaseorders_url
    assert_response :success
  end

  test 'should get index redirect, if not signed in' do
    get purchaseorders_url
    assert_redirected_to new_user_session_url
  end

  test 'should get new' do
    sign_in users(:one)
    get new_purchaseorder_url
    assert_response :success
  end

  test 'should get new, if not signed in' do
    get new_purchaseorder_url
    assert_redirected_to new_user_session_url
  end

  test 'should create purchaseorder' do
    sign_in users(:one)
    assert_difference('Purchaseorder.count') do
      post purchaseorders_url, params: { purchaseorder: { status: @purchaseorder.status } }
    end

    assert_redirected_to purchaseorder_url(Purchaseorder.last)
  end

  test 'should create purchaseorder, redirects if not signed in' do
    post purchaseorders_url, params: { purchaseorder: { status: @purchaseorder.status } }
    assert_redirected_to new_user_session_url
  end

  test 'should show purchaseorder' do
    sign_in users(:one)
    get purchaseorder_url(@purchaseorder)
    assert_response :success
  end

  test 'should show purchaseorder redirects, if not signed in' do
    get purchaseorder_url(@purchaseorder)
    assert_redirected_to new_user_session_url
  end

  test 'should get edit' do
    sign_in users(:one)
    get edit_purchaseorder_url(@purchaseorder)
    assert_response :success
  end

  test 'should get edit, redirects if not signed in' do
    get edit_purchaseorder_url(@purchaseorder)
    assert_redirected_to new_user_session_url
  end


  test 'should update purchaseorder' do
    sign_in users(:one)
    patch purchaseorder_url(@purchaseorder), params: { purchaseorder: { status: @purchaseorder.status } }
    assert_redirected_to purchaseorder_url(@purchaseorder)
  end

  test 'should update purchaseorder redirects, if not signed in' do
    patch purchaseorder_url(@purchaseorder), params: { purchaseorder: { status: @purchaseorder.status } }
    assert_redirected_to new_user_session_url
  end

  test 'should destroy purchaseorder' do
    sign_in users(:one)
    assert_difference('Purchaseorder.count', -1) do
      delete purchaseorder_url(@purchaseorder)
    end

    assert_redirected_to purchaseorders_url
  end

  test 'should destroy purchaseorder redirects, if not signed in' do
    delete purchaseorder_url(@purchaseorder)
    assert_redirected_to new_user_session_url
  end
end
