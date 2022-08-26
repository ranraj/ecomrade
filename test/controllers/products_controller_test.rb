# frozen_string_literal: true

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @product = products(:one)
  end

  test 'should get index' do
    get products_url
    assert_response :success
  end

  # test 'should get new request redirect, if not signed in' do
  #   get new_product_url
  #   assert_response :redirect
  # end

  # test 'should get new ' do
  #   sign_in users(:one)
  #   get new_product_url
  #   assert_response :success
  # end

  # test 'should create product redirect, if not signed in' do
  #   post products_url,
  #        params: { product: { code: @product.code, description: @product.description, image_link: @product.image_link,
  #                             name: @product.name, price: @product.price, category_id: @category.id } }
  #   assert_response :redirect
  # end

  # test 'should create product' do
  #   sign_in users(:one)
  #   assert_difference('Product.count') do
  #     post products_url,
  #          params: { product: { code: @product.code, description: @product.description, image_link: @product.image_link,
  #                               name: @product.name, price: @product.price, category_id: @category.id } }
  #   end

  #   assert_redirected_to product_url(Product.last)
  # end

  # test 'should show product' do
  #   get product_url(@product)
  #   assert_response :success
  # end

  # test 'should get edit' do
  #   sign_in users(:one)
  #   get edit_product_url(@product)
  #   assert_response :success
  # end

  # test 'should get edit redirects if not signed in' do
  #   get edit_product_url(@product)
  #   assert_response :redirect
  # end

  # test 'should update product' do
  #   sign_in users(:one)
  #   patch product_url(@product),
  #         params: { product: { code: @product.code, description: @product.description, image_link: @product.image_link,
  #                              name: @product.name, price: @product.price,category_id: @category.id } }
  #   assert_redirected_to product_url(@product)
  # end

  # test 'should update product redirect if not signed in' do
  #   patch product_url(@product),
  #         params: { product: { code: @product.code, description: @product.description, image_link: @product.image_link,
  #                              name: @product.name, price: @product.price,category_id: @category.id } }
  #   assert_response :redirect
  # end

  # test 'should destroy product' do
  #   sign_in users(:one)
  #   assert_difference('Product.count', -1) do
  #     delete product_url(@product)
  #   end

  #   assert_redirected_to products_url
  # end

  # test 'should destroy product redirect if not signed in' do
  #   delete product_url(@product)
  #   assert_response :redirect
  # end
end
