# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /products or /products.json
  def index
    @products = if search_string
                  Product.search_for(search_string, page: params[:page], per_page: 25)
                else
                  Product.order(updated_at: :desc).page(params[:page])
                end
    puts "s"
    puts @products
    puts "s"
  end

  # GET /products/1 or /products/1.json
  def show
    @productwatcher = Productwatcher.new
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: I18n.t('product.message.create.success') }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: I18n.t('product.message.update.success') }
        format.json { render :show, status: :ok, location: @product }
        # @product.delay.notify
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: I18n.t('product.message.destroy.success') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :code, :price, :image_link)
  end

  helper_method def search_string
    params[:query].presence
  end
end
