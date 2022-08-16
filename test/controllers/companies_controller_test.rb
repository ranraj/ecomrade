# frozen_string_literal: true

require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @company = companies(:one)
  end

  test 'should get index' do
    sign_in users(:one)
    get companies_url
    assert_response :success
  end

  test 'should get index redirects, if not signed in' do
    get companies_url
    assert_redirected_to new_user_session_url
  end

  test 'should get new' do
    sign_in users(:one)
    get new_company_url
    assert_response :success
  end

  test 'should get new redirects, if not signed in' do
    get new_company_url
    assert_redirected_to new_user_session_url
  end

  test 'should create company' do
    sign_in users(:one)
    assert_difference('Company.count') do
      post companies_url,
           params: { company: { code: @company.code, description: @company.description, logo: @company.logo,
                                name: @company.name, user_id: @user.id } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test 'should create company redirects, if not signed in' do
    post companies_url,
         params: { company: { code: @company.code, description: @company.description, logo: @company.logo,
                              name: @company.name, user_id: @user.id } }

    assert_redirected_to new_user_session_url
  end

  test 'should show company' do
    sign_in users(:one)
    get company_url(@company)
    assert_response :success
  end

  test 'should show company redirects, if not signed in' do
    get company_url(@company)
    assert_redirected_to new_user_session_url
  end

  # test 'should get edit' do
  #   sign_in users(:one)
  #   get edit_company_url(@company)
  #   assert_response :success
  # end

  test 'should get edit redirects, if not signed in' do
    get edit_company_url(@company)
    assert_redirected_to new_user_session_url
  end

  # test 'should update company' do
  #   sign_in users(:one)
  #   patch company_url(@company),
  #         params: { company: { code: @company.code, description: @company.description, logo: @company.logo,
  #                              name: @company.name, user_id: @user.id } }
  #   assert_redirected_to company_url(@company)
  # end

  test 'should update company redirects, if not signed in' do
    patch company_url(@company),
          params: { company: { code: @company.code, description: @company.description, logo: @company.logo,
                               name: @company.name, user_id: @user.id } }
    assert_redirected_to new_user_session_url
  end

  # test 'should destroy company' do
  #   sign_in users(:one)
  #   assert_difference('Company.count', -1) do
  #     delete company_url(@company)
  #   end

  #   assert_redirected_to companies_url
  # end

  test 'should destroy company redirects, if not signed in' do
    delete company_url(@company)
    assert_redirected_to new_user_session_url
  end
end
