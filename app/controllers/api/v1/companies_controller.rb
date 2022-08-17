# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < ApiController
      def index
        @companies = current_user.company.page(params[:page])
      end
    end
  end
end
