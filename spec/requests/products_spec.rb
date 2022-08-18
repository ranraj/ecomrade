# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  # describe "GET /products" do
  #   it 'return response success' do
  #     get products_path
  #     expect(response).to have_http_status(200)
  #   end
  # end

  # describe "POST /products" do
  #   it 'return response redirect, if not signed in' do
  #     post products_path
  #     expect(response).to have_http_status(302)
  #   end
  # end

  context 'Authenticated user' do
    let!(:user) { create(:user) }
    let!(:product) { create(:product) }
    let(:valid_attributes) { FactoryBot.attributes_for(:product) }
    before do
      sign_in user
    end

    describe 'POST /products authenticated true' do
      it 'with valid parameters' do
        sign_in user
        expect do
          post products_path, params: { product: valid_attributes }
        end.to change(Product, :count).by(1)
      end
    end
  end
end
