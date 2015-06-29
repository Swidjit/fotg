class OtherGamesController < ApplicationController
  respond_to :html
  before_filter :load_resource_from_id, :except => [:index]

  def show
    @comments = @game.comment_threads.order('created_at desc')
  end

  def index
    @games = OtherGame.all
  end

  private

  def load_resource_from_id
    #handle old urls anomalies
    params[:id] = 'alpha-drop' if params[:id] == 'alpha-dro'
    params[:id] = 'typing-tone' if params[:id] == 'typing-tone-2'
    begin
      @game = OtherGame.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      # for urls that end with -game
      begin
        @game = OtherGame.friendly.find(params[:id][0..-6])
      rescue ActiveRecord::RecordNotFound => e
        redirect_to games_path
      end
    end

    if user_signed_in?
      @new_comment = Comment.build_from(@game, current_user.id, "")
    end
  end

end
