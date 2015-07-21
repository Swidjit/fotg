class GamesController < ApplicationController
  respond_to :html
  before_filter :load_resource_from_id, :except => [:index, :spot_value]

  def show
    #@user_ranking = Ranking.where(:game_id => params[:id], :user_id => current_user.id).first if user_signed_in?
    #@best = Ranking.where(:game_id => params[:id]).order(score: :desc).limit(10)

    @comments = @game.comment_threads.order('created_at desc')
    if user_signed_in?
      @new_comment = Comment.build_from(@game, current_user.id, "")
    end
    @high_scores = @game.scores.order(value: :desc).take(10)

  end

  def index
     @games = Game.all
  end

  def init_score
    if user_signed_in?
      @score = Score.new(:scoreable_id=>@game.id,:scoreable_type => 'Game', :user=>current_user, :game_session => params[:game_session], :status=>'initialized')
    else
      @score = Score.new(:scoreable_id=>@game.id,:scoreable_type => 'Game', :session_id=>cookies[:session_id].to_i, :game_session => params[:game_session], :status=>'initialized')
    end
    @score.save
    @score.value = -1
    if @score.save
       respond_to do |format|
        format.js {render 'init_score'}
      end
    end
  end

  def save_score
    if user_signed_in?
      @score = Score.where(:game_session=>params[:game_session]).last
      @score.value = params[:score]
      @score.status = params[:status]

      if @score.save

      end
    else
      @score = Score.where(:game_session=>params[:game_session]).last
      @score.value = params[:score]
      @score.status = params[:status]
      @score.save
    end

    @high_scores = @game.scores.order(value: :desc).take(10)
    @top_averages = @game.game_stats.order(avg: :desc).take(10)
  end


  def load_resource_from_id
    begin
      @game = Game.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      # for urls that end with -game
      begin
        @game = Game.friendly.find(params[:id][0..-6])
      rescue ActiveRecord::RecordNotFound => e
        redirect_to games_path
      end
    end
  end

end
