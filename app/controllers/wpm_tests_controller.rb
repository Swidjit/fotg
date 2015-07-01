class WpmTestsController < ApplicationController
  respond_to :html
  before_filter :load_resource_from_id, :except => [:index]

  def show
    @user_ranking = Ranking.where(:game_id => params[:id], :user_id => current_user.id).first if user_signed_in?
    #@best = Ranking.where(:game_id => params[:id]).order(score: :desc).limit(10)
    #@worst = Ranking.where(:game_id => params[:id]).order(:score).limit(10)
    #@streaks = @game.streaks.where(:direction=>"good").order(streak: :desc).limit(10)
    @comments = @game.comment_threads.order('created_at desc')
    @eligible_games = (1..WpmTest.all.count).to_a
    @eligibility_times = []
    if user_signed_in?
      @new_comment = Comment.build_from(@game, current_user.id, "")
      @recently_played = Score.where('user_id=? and scoreable_type=? and created_at >= ?',current_user.id,@game.class, 1.weeks.ago).map(&:scoreable_id)
      @eligible_games = @eligible_games - @recently_played

    else

      @recently_played = Score.where('session_id=? and scoreable_type=? and created_at >= ?',cookies[:session_id],@game.class, 1.weeks.ago).map(&:scoreable_id)
      @eligible_games = @eligible_games - @recently_played
    end

    @game_eligibility = @eligible_games.include?(@game.id)

  end

  def index
    @games = WpmTest.all
  end

  def init_score
    if user_signed_in?
      @score = Score.new(:game=>@game, :user=>current_user, :value=>-1)
    else
      @score = Score.new(:game=>@game, :session_id=>params[:session_id], :value=>-1)
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
      @score = Score.where(:game=>@game, :user=>current_user, :value=>-1).last
      @score.value = params[:score]
      if @score.save!
        @game.increment!(:plays)
        @game_stat = WpmTestStat.where(:game_id => @score.game.id, :user_id => current_user.id).first
        if @game_stat.present?
          new_score = @game_stat.total + @score.value
          play_count = @game_stat.plays + 1
          new_avg = new_score/play_count.to_f
          @game_stat.assign_attributes(:total=> new_score, :plays => play_count, :avg => new_avg)
        else
          @game_stat = WpmTestStat.new(:total=> @score.value, :plays => 1, :avg => @score.value, :user_id => @score.user.id, :game_id => @score.game.id)
        end
        @game_stat.save

        require 'descriptive_statistics'
        data = Score.where('game_id = ? and created_at > ?', @game.id, Time.now-6.hours).collect(&:value)
        dev = data.standard_deviation

        score_diff = @score.value - data.mean

        num_devs = score_diff/dev.to_f
        @stat_score = 500 + (100*num_devs).to_i
        @percentile = data.percentile_rank(@score.value).to_i
        streak = current_user.streaks.where(:game_id => @game.id).first
        if streak.streak >= 2
          if streak.direction == "good"
            @streak_msg = "That's #{streak.streak} consecutive above average performances!"
          else
            @streak_msg = "That's #{streak.streak} consecutive below average performances :("
          end

        end


      end
    else
      @score = Score.where(:game=>@game, :session_id=>params[:session_id], :value=>-1).last
      @score.value = params[:score]
      @score.save!
    end

  end


  def game_averages

  end

  def load_resource_from_id
    @game = WpmTest.friendly.find(params[:id])
  end

end
