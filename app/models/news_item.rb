# frozen_string_literal: true

class NewsItem < ApplicationRecord
  belongs_to :representative
  has_many :ratings, dependent: :delete_all

  ISSUES = ["Free Speech", "Immigration", "Terrorism", "Social Security and Medicare", "Abortion",
            "Student Loans", "Gun Control", "Unemployment", "Climate Change", "Homelessness",
            "Racism", "Tax Reform", "Net Neutrality", "Religious Freedom", "Border Security",
            "Minimum Wage", "Equal Pay"].freeze
  RATING = %w[1 2 3 4 5 6 7 8 9 10].freeze
  validates :issue, inclusion: { in: ISSUES, message: "%<value>s is not a valid issue" }
  validates :title, :link, presence: true

  def self.find_for(representative_id)
    NewsItem.find_by(
      representative_id: representative_id
    )
  end

  def self.news_api_to_news_item_params(articles_info, issues, rep)
    top5 = JSON.parse(articles_info.to_json)
    articles = []
    counter = 0
    top5.drop(1).each do |article|
      next unless article["title"] != "[Removed]" && counter < 5

      art = { representative: rep, title: article["title"], link: article["url"], description: article["description"],
issue: issues }
      articles.push(art)
      counter += 1
    end
    articles
  end

  def self.news_api_to_news_item_params_index(articles_info, issues, rep, index)
    top5 = JSON.parse(articles_info.to_json)
    art = NewsItem.new
    counter = 0
    top5.drop(1).each_with_index do |article, _index|
      next unless article["title"] != "[Removed]" && counter < 5

      if counter == index.to_i
        art = NewsItem.find_or_create_by!({ representative: rep, title: article["title"], link: article["url"],
description: article["description"], issue: issues })

      end
      counter += 1
    end
    art
  end
end

#------------------------------------------------------------------------------
# NewsItem
#
# Name              SQL Type             Null    Primary Default
# ----------------- -------------------- ------- ------- ----------
# id                INTEGER              false   true
# title             varchar              false   false
# link              varchar              false   false
# description       TEXT                 true    false
# representative_id INTEGER              false   false
# created_at        datetime             false   false
# updated_at        datetime             false   false
#
#------------------------------------------------------------------------------
