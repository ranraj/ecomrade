# frozen_string_literal: true

class ProductwatchersController < ApplicationController
  before_action :set_productwatcher, only: %i[show edit update destroy]
  before_action :authenticate_user!

  logger = Rails.logger

  # GET /productwatchers or /productwatchers.json
  def index
    @productwatchers = current_user.productwatcher.page(params[:page])
  end

  # GET /productwatchers/1 or /productwatchers/1.json
  def show; end

  # GET /productwatchers/new
  def new
    @productwatcher = Productwatcher.new
  end

  # GET /productwatchers/1/edit
  def edit; end

  # POST /productwatchers or /productwatchers.json
  def create
    @productwatcher = Productwatcher.new(productwatcher_params)

    logger.info @productwatcher
    respond_to do |format|
      if @productwatcher.save
        format.html do
          redirect_to productwatcher_url(@productwatcher), notice: I18n.t('productwatcher.message.create.success')
        end
        format.json { render :show, status: :created, location: @productwatcher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @productwatcher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productwatchers/1 or /productwatchers/1.json
  def update
    respond_to do |format|
      if @productwatcher.update(productwatcher_params)
        format.html do
          redirect_to productwatcher_url(@productwatcher), notice: I18n.t('productwatcher.message.update.success')
        end
        format.json { render :show, status: :ok, location: @productwatcher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @productwatcher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productwatchers/1 or /productwatchers/1.json
  def destroy
    @productwatcher.destroy

    respond_to do |format|
      format.html { redirect_to productwatchers_url, notice: I18n.t('productwatcher.message.destroy.success') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_productwatcher
    @productwatcher = Productwatcher.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def productwatcher_params
    params.require(:productwatcher).permit(:status, :user_id, :product_id)
  end
end
