class PagesController < ApplicationController

  def home
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup' || action_name == 'sign_in' || action_name == 'sign_up'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user
      if current_user.username.include?('dummy-')
        redirect_to finish_signup_path(current_user)
      end
    end
    @games = Game.all
    @other_games = OtherGame.all
    @typing_news = TypingNews.order(created_at: :desc).take(5)
    @kids_games = OtherGame.where('id in (?)',(20..25))
  end

  def index
    @title = params[:page_name].titleize

    render params[:page_name]
  end

  def words
    render 'words.txt'
  end
  def words_over_3
    render 'words-over-3.txt'
  end
end
