# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_cart
  
  add_flash_types :info, :error, :success

  def append_info_to_payload(payload)
    super
    payload[:host] = request.host
    payload[:remote_ip] = request.remote_ip
    payload[:ip] = request.ip
  end

  private
    def current_cart
      if user_signed_in?
        @current_cart = current_user.cart
      end       
    end
end
