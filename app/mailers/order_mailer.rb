# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  logger = Rails.logger
  def new_order_email
    @purchaseorder = params[:purchaseorder]
    @user = params[:user]
    logger.info Rails.configuration.x.payment_processing.schedule
    mail(to: @user.email, subject: I18n.t('purchaseorder.lable.order_email_subject'))
  rescue StandardError => e
    logger.error e.message
  end
end
