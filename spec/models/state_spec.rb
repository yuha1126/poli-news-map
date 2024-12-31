# frozen_string_literal: true

require 'rails_helper'

# This is a scaffold of a spec, it doesn't test anything yet...

RSpec.describe State, type: :model do
  before do
    @state = described_class.create!(name: "Bob", symbol: "Joe", fips_code: 1, is_territory: 1, lat_min: 1.0,
                                     lat_max: 2.0, long_min: 1.0, long_max: 2.0)
  end

  describe 'state function name' do
    it 'output fips_code of state' do
      expect(@state.std_fips_code).to eq("01")
    end
  end
end
