# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsItem, type: :model do
  describe 'validations' do
    it 'validates inclusion of issue in predefined list' do
      # valid_news_item = NewsItem.new(title: 'Title', description: 'asdf',
      #                                 link: 'https://example.com', issue: 'Climate Change', representative_id: 1)
      invalid_news_item = described_class.new(title: 'Title', link: 'https://example.com', issue: 'Invalid',
                                              representative_id: 1)

      # expect(valid_news_item).to be_valid
      expect(invalid_news_item).not_to be_valid
      expect(invalid_news_item.errors[:issue]).to include('Invalid is not a valid issue')
    end
  end

  describe '.find_for' do
    it 'returns a news item for the representative' do
      rep = Representative.create!(name: 'Rep A')
      news_item = described_class.create!(title: 'Title', link: 'https://example.com', representative: rep,
                                          issue: 'Climate Change')

      expect(described_class.find_for(rep.id)).to eq(news_item)
    end
  end
end
