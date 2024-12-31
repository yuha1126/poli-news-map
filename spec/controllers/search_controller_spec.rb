# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #search' do
    it 'returns http success' do
      get :search, params: { address: 'California' }
      expect(response).to have_http_status(:success)
    end

    it 'renders the search template' do
      get :search, params: { address: 'California' }
      expect(response).to render_template('search')
    end

    it 'assigns @representatives' do
      allow(Representative).to receive(:civic_api_to_representative_params).and_return([]) # Mock the method
      get :search, params: { address: 'California' }
      expect(assigns(:representatives)).to eq([])
    end
  end
end
