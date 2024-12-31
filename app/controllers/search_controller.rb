# frozen_string_literal: true

require 'google/apis/civicinfo_v2'

class SearchController < ApplicationController
  def search
    flash.clear
    address = params[:address]

    if address.blank?
      flash[:alert] = "No representatives found"
      redirect_to representatives_path
    else
      service = Google::Apis::CivicinfoV2::CivicInfoService.new
      service.key = Rails.application.credentials[:GOOGLE_API_KEY]
      # this part was added because it errored if you searched with an
      # empty query. This basically checks if service.representative_info_by_address
      # fails, it just returns an empty list
      begin
        result = service.representative_info_by_address(address: address)
      rescue Google::Apis::ClientError
        @representatives = []
        flash[:alert] = "No representatives found"
        render 'representatives/index'
      else
        @representatives = Representative.civic_api_to_representative_params(result)
        render 'representatives/search'
      end
    end
  end
end
