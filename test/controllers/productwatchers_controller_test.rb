# frozen_string_literal: true

require 'test_helper'

class ProductwatchersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @productwatcher = productwatchers(:one)
  end

  test 'should get index' do
    sign_in users(:one)
    get productwatchers_url
    assert_response :success
  end

  test 'should get index redirects if not signed in' do
    get productwatchers_url
    assert_redirected_to new_user_session_url
  end

  test 'should get new' do
    get new_productwatcher_url
    assert_response :redirect
  end

  test 'should get new redirects if not signed in' do
    sign_in users(:one)
    get new_productwatcher_url
    assert_response :success
  end

  test 'should create productwatcher' do
    user = users(:one)
    sign_in user
    product_id = products(:one).id
    user_id = user.id
    assert_difference('Productwatcher.count') do
      post productwatchers_url,
           params: { productwatcher: { status: @productwatcher.status, user_id:, product_id: } }
      assert_redirected_to productwatcher_url(Productwatcher.last)
    end
  end

  test 'should create productwatcher redirects if not signed in' do
    product_id = products(:one).id
    user_id = users(:one)
    post productwatchers_url,
         params: { productwatcher: { status: @productwatcher.status, user_id:, product_id: } }
    assert_redirected_to new_user_session_url
  end

  test 'should show productwatcher' do
    sign_in users(:one)
    get productwatcher_url(@productwatcher)
    assert_response :success
  end

  test 'should show productwatcher redirects if not signed in' do
    get productwatcher_url(@productwatcher)
    assert_redirected_to new_user_session_url
  end

  test 'should get edit' do
    sign_in users(:one)
    get edit_productwatcher_url(@productwatcher)
    assert_response :success
  end

  test 'should get edit redirects if not signed in' do
    get edit_productwatcher_url(@productwatcher)
    assert_response :redirect
  end

  test 'should update productwatcher redirects if not signed in' do
    product_id = products(:one).id
    user_id = users(:one).id
    patch productwatcher_url(@productwatcher),
          params: { productwatcher: { status: @productwatcher.status, user_id:, product_id: } }
    assert_redirected_to new_user_session_url
  end

  test 'should update productwatcher' do
    user = users(:one)
    sign_in user
    product_id = products(:one).id
    user_id = user.id
    patch productwatcher_url(@productwatcher),
          params: { productwatcher: { status: @productwatcher.status, user_id:, product_id: } }
    assert_redirected_to productwatcher_url(@productwatcher)
  end

  test 'should destroy productwatcher' do
    sign_in users(:one)
    assert_difference('Productwatcher.count', -1) do
      delete productwatcher_url(@productwatcher)
    end
    assert_redirected_to productwatchers_url
  end

  test 'should destroy productwatcher redirects if not signed in' do
    delete productwatcher_url(@productwatcher)
    assert_redirected_to new_user_session_url
  end
end
