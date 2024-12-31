# frozen_string_literal: true

require 'rails_helper'
require 'ostruct'

RSpec.describe User, type: :model do
  before do
    @user = described_class.create!(first_name: "Bob", last_name: "Joe", provider: 1, uid: "1",
                                    email: "bobjoe@gmail.com")
  end

  describe 'model function name' do
    it 'output name of user' do
      expect(@user.name).to eq("Bob Joe")
    end
  end
end
