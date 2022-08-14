require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it 'return response success' do
      get products_path
      expect(response).to have_http_status(200)
    end  
  end

  describe "POST /products" do
    it 'return response redirect, if not signed in' do
      post products_path
      expect(response).to have_http_status(302)
    end  
  end

end
