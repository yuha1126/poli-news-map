# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MyNewsItemsController, type: :controller do
  let(:representative) { Representative.create!(name: 'Joe Biden') }
  let(:valid_attributes) do
    { title: 'Ssmple', description: 'description', link: 'http://example.com', representative_id: representative.id, issue: 'Racism' }
  end

  let(:news_item) { NewsItem.create!(valid_attributes) }

  describe 'GET #edit' do
    it 'assigns the requested news item' do
      get :edit, params: { id: news_item.id, representative_id: representative.id }
      expect(assigns(:news_item)).not_to eq(news_item)
    end
  end
end
