# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < ApiController
      def index
        @companies = Company.all
      end
    end
  end
end
