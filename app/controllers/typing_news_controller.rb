class TypingNewsController < ApplicationController
  def index
    @typing_news = TypingNews.take(10)
  end

  def new
    @typing_news = TypingNews.new
  end

  def create
    @typing_news = TypingNews.create(news_params)
    redirect_to typing_news_index_path
  end

  private

  def news_params
    params.require(:typing_news).permit(:body, :title, :url)
  end
end
