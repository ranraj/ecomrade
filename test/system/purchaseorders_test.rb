# frozen_string_literal: true

require 'application_system_test_case'

class PurchaseordersTest < ApplicationSystemTestCase
  setup do
    @purchaseorder = purchaseorders(:one)
  end

  test 'visiting the index' do
    visit purchaseorders_url
    assert_selector 'h1', text: 'Purchaseorders'
  end

  test 'should create purchaseorder' do
    visit purchaseorders_url
    click_on 'New purchaseorder'

    fill_in 'Status', with: @purchaseorder.status
    click_on 'Create Purchaseorder'

    assert_text 'Purchaseorder was successfully created'
    click_on 'Back'
  end

  test 'should update Purchaseorder' do
    visit purchaseorder_url(@purchaseorder)
    click_on 'Edit this purchaseorder', match: :first

    fill_in 'Status', with: @purchaseorder.status
    click_on 'Update Purchaseorder'

    assert_text 'Purchaseorder was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Purchaseorder' do
    visit purchaseorder_url(@purchaseorder)
    click_on 'Destroy this purchaseorder', match: :first

    assert_text 'Purchaseorder was successfully destroyed'
  end
end
