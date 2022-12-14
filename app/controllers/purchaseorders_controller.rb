# frozen_string_literal: true

class PurchaseordersController < ApplicationController
  before_action :set_purchaseorder, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /purchaseorders or /purchaseorders.json
  def index
    @purchaseorders = current_user.purchaseorder.page(params[:page])
  end

  # GET /purchaseorders/1 or /purchaseorders/1.json
  def show; end

  # GET /purchaseorders/new
  def new
    @purchaseorder = Purchaseorder.new
  end

  # GET /purchaseorders/1/edit
  def edit; end

  # POST /purchaseorders or /purchaseorders.json
  def create
    @purchaseorder = Purchaseorder.new(purchaseorder_params)

    respond_to do |format|
      if @purchaseorder.save
        begin
          # Sidekiq async
          OrderProvisionWorker.perform_async(@purchaseorder)
          # OrderMailer.with(purchaseorder: @purchaseorder,user: current_user).new_order_email.deliver_later
          OrderMailer.with(purchaseorder: @purchaseorder, user: current_user).new_order_email.deliver_now!
          format.html do
            redirect_to purchaseorder_url(@purchaseorder), notice: I18n.t('purchaseorder.message.create.success')
          end
          format.json { render :show, status: :created, location: @purchaseorder }
        rescue StandardError => e
          logger.error e.message
          logger.error e.backtrace.join("\n")
          format.html do
            redirect_to purchaseorder_url(@purchaseorder),
                        flash: { error: I18n.t('application.common.exception.internal_server') }
          end
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchaseorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchaseorders/1 or /purchaseorders/1.json
  def update
    respond_to do |format|
      if @purchaseorder.update(purchaseorder_params)
        format.html do
          redirect_to purchaseorder_url(@purchaseorder), notice: I18n.t('purchaseorder.message.update.success')
        end
        format.json { render :show, status: :ok, location: @purchaseorder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchaseorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchaseorders/1 or /purchaseorders/1.json
  def destroy
    @purchaseorder.destroy

    respond_to do |format|
      format.html { redirect_to purchaseorders_url, notice: I18n.t('purchaseorder.message.destroy.success') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchaseorder
    @purchaseorder = Purchaseorder.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def purchaseorder_params
    params.require(:purchaseorder).permit(:status, :user_id)
  end
end
