class GamesController < ApplicationController
  respond_to :html
  before_filter :load_resource_from_id, :except => [:index, :spot_value]

  require 'action_view'

  include ActionView::Helpers::DateHelper
  def show
    #@user_ranking = Ranking.where(:game_id => params[:id], :user_id => current_user.id).first if user_signed_in?
    #@best = Ranking.where(:game_id => params[:id]).order(score: :desc).limit(10)
    #@worst = Ranking.where(:game_id => params[:id]).order(:score).limit(10)
    #@streaks = @game.streaks.where(:direction=>"good").order(streak: :desc).limit(10)
    @comments = @game.comment_threads.order('created_at desc')
    if user_signed_in?
      @new_comment = Comment.build_from(@game, current_user.id, "")
    end
    @high_scores = @game.scores.order(value: :desc).take(10)


  end

  def index
     @games = Game.all
    #redirect_to other_games_path
  end

  def init_score
    if user_signed_in?
      @score = Score.new(:game=>@game, :user=>current_user, :value=>-1)
    else
      @score = Score.new(:scoreable_id=>@game.id,:scoreable_type => 'Game', :session_id=>cookies[:session_id].to_i, :game_session => params[:game_session],:value=>-1)
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
      @score = Score.where(:scoreable_id=>@game.id,:scoreable_type => 'Game', :user=>current_user, game_session=>params[:game_session]).last
      @score.value = params[:score]
      if @score.save!


      end
    else
      @score = Score.where(:scoreable_id=>@game.id,:scoreable_type => 'Game', :session_id=>cookies[:session_id].to_i, :game_session=>params[:game_session]).last
      @score.value = params[:score]
      @score.save!
    end

    @high_scores = @game.scores.order(value: :desc).take(10)
  end

  def spot_value
    @spot = SpotValue.first
    @s = @spot.value
    if user_signed_in?
      @score = Score.new(:game_id=>2, :user=>current_user, :value=>@s)
      if @score.save!
        @game=Game.find(2)
        @game.increment!(:plays)
        @game_stat = GameStat.where(:game_id => @score.game.id, :user_id => current_user.id).first
        if @game_stat.present?
          new_score = @game_stat.total + @score.value
          play_count = @game_stat.plays + 1
          new_avg = new_score/play_count.to_f
          @game_stat.assign_attributes(:total=> new_score, :plays => play_count, :avg => new_avg)
        else
          @game_stat = GameStat.new(:total=> @score.value, :plays => 1, :avg => @score.value, :user_id => @score.user.id, :game_id => @score.game.id)
        end
        @game_stat.save
      end
    else
      @score = Score.new(:game_id=>2, :session_id => cookies[:session_id], :value=>@s)
      @score.save
    end
    @spot.destroy

    respond_to do |format|
      format.js {render 'spot_value'}
    end
  end

  def game_averages

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
