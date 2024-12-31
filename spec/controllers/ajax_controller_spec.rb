# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AjaxController, type: :controller do
  describe 'GET #counties' do
    before do
      State.create!(id: 1, name: 'California', symbol: 'CA',
                    created_at: DateTime.now, updated_at: DateTime.now,
                    lat_min: 0, lat_max: 0, long_min: 0, long_max: 0,
                    is_territory: 0, fips_code: 1)
      County.create!(id: 2, name: 'Los Angeles',
                     state_id: 1, fips_code: 1, fips_class: 'asdf',
                     created_at: DateTime.now, updated_at: DateTime.now)
    end

    context 'when state_symbol is invalid' do
      it 'returns an empty JSON array' do
        get :counties, params: { state_symbol: 'CA' }

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).not_to be_empty
      end
    end
  end
end
