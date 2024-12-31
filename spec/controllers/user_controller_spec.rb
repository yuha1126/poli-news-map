# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserController, type: :controller do
  describe 'GET #profile' do
    context 'when no user is logged in' do
      before do
        session[:current_user_id] = nil
        get :profile
      end

      it 'redirects to the login page' do
        expect(response).to redirect_to(login_url)
      end
    end
  end
end
