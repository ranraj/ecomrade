class OrderMailer < ApplicationMailer
    logger = Rails.logger
    def new_order_email
        begin
            @purchaseorder = params[:purchaseorder]
            @user = params[:user]
            logger.info Rails.configuration.x.payment_processing.schedule
            mail(to: @user.email, subject: I18n.t("purchaseorder.lable.order_email_subject"))    
        rescue => exception
            logger.error exception.message
        end
        
    end
end
