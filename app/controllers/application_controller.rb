# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :success

  def append_info_to_payload(payload)
    super
    payload[:host] = request.host
    payload[:remote_ip] = request.remote_ip
    payload[:ip] = request.ip
  end
end
