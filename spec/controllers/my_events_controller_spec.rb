# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MyEventsController, type: :controller do
  let(:valid_attributes) do
    { name: 'Sample', county_id: 0o01, description: 'its an event', start_time: Time.zone.now + 1.hour,
end_time: Time.zone.now + 2.hours }
  end

  let(:event) { Event.create!(valid_attributes) }

  describe 'GET #new' do
    it 'assigns a new event as @event' do
      get :new
      expect(assigns(:event)).not_to be_a_new(Event)
    end
  end
end
