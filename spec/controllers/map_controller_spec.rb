# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MapController, type: :controller do
  describe "GET #index" do
    before do
      @state1 = State.create!(name: "Texas", fips_code: "48", symbol: "TX", lat_min: 25.84,
                              lat_max: 36.58, long_min: -106.65, long_max: -93.51, is_territory: false)
      @state2 = State.create!(name: "New York", fips_code: "36", symbol: "NY", lat_min: 40.47,
                              lat_max: 45.01, long_min: -79.76, long_max: -71.85, is_territory: false)
    end

    it "assigns states and organizes by FIPS code" do
      get :index
      expect(assigns(:states)).to match_array([@state1, @state2])
      expect(assigns(:states_by_fips_code)["48"]).to eq(@state1)
      expect(assigns(:states_by_fips_code)["36"]).to eq(@state2)
    end
  end

  describe "GET #state" do
    it "redirects and alerts if state doesn't exist" do
      get :state, params: { state_symbol: "XX" }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq("State 'XX' not found.")
    end
  end
end
