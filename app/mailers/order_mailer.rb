# frozen_string_literal: true

# Order notification email
class OrderMailer < ApplicationMailer
  def new_order_email
    @purchaseorder = params[:purchaseorder]
    @user = params[:user]
    Rails.logger.info Rails.configuration.x.payment_processing.schedule
    mail(to: @user.email, subject: I18n.t('purchaseorder.lable.order_email_subject'))
  rescue StandardError => e
    Rails.logger.error e.message
  end
end
