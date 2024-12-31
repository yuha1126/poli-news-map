# frozen_string_literal: true

require 'news-api'

class MyNewsItemsController < SessionController
  before_action :set_representative
  before_action :set_representatives_list
  before_action :set_news_item, only: %i[edit update destroy]

  def new
    @news_item = NewsItem.new
  end

  def edit; end

  def create
    @news_item = NewsItem.new(news_item_params)
    if @news_item.save
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
  end

  def update
    if @news_item.update(news_item_params)
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully updated.'
    else
      render :edit, error: 'An error occurred when updating the news item.'
    end
  end

  def destroy
    @news_item.destroy
    redirect_to representative_news_items_path(@representative),
                notice: 'News was successfully destroyed.'
  end

  def select
    @issue = params[:news_item][:issue]
    @rep = Representative.find(
      params[:news_item][:representative_id]
    )
    key = Rails.application.credentials[:NEWS_API_KEY]
    newsapi = News.new(key)
    top5 = newsapi.get_everything(q:      "#{@rep.name} #{@issue}",
                                  sortBy: 'popularity')

    @articles = NewsItem.news_api_to_news_item_params(top5, @issue, @rep)
  end

  def save
    index = params["index"]
    @issue = params["issue"]
    @rep = Representative.find(
      params["representative"]
    )
    key = Rails.application.credentials[:NEWS_API_KEY]
    newsapi = News.new(key)
    top5 = newsapi.get_everything(q:      "#{@rep.name} #{@issue}",
                                  sortBy: 'popularity')

    @news_item = NewsItem.news_api_to_news_item_params_index(top5, @issue, @rep, index)
    if @news_item.save
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
  end

  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end

  def set_representatives_list
    @representatives_list = Representative.all.map { |r| [r.name, r.id] }
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def news_item_params
    params.require(:news_item).permit(:news, :title, :description, :link, :representative_id, :issue)
  end
end
