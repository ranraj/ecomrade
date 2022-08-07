require 'test_helper'

class PurchaseordersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchaseorder = purchaseorders(:one)
  end

  test 'should get index' do
    get purchaseorders_url
    assert_response :success
  end

  test 'should get new' do
    get new_purchaseorder_url
    assert_response :success
  end

  test 'should create purchaseorder' do
    assert_difference('Purchaseorder.count') do
      post purchaseorders_url, params: { purchaseorder: { status: @purchaseorder.status } }
    end

    assert_redirected_to purchaseorder_url(Purchaseorder.last)
  end

  test 'should show purchaseorder' do
    get purchaseorder_url(@purchaseorder)
    assert_response :success
  end

  test 'should get edit' do
    get edit_purchaseorder_url(@purchaseorder)
    assert_response :success
  end

  test 'should update purchaseorder' do
    patch purchaseorder_url(@purchaseorder), params: { purchaseorder: { status: @purchaseorder.status } }
    assert_redirected_to purchaseorder_url(@purchaseorder)
  end

  test 'should destroy purchaseorder' do
    assert_difference('Purchaseorder.count', -1) do
      delete purchaseorder_url(@purchaseorder)
    end

    assert_redirected_to purchaseorders_url
  end
end
