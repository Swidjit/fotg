class Score < ActiveRecord::Base
  # attr_accessible :title, :description, :logo_url, :board_count, :rating, :times_played
  belongs_to :user
  belongs_to :scoreable, polymorphic: true
  # validates :value, :uniqueness => {:scope => [:user, :game, :game_num]}
  # acts_as_commentable
  after_save :calculate_game_stats

  def calculate_game_stats
    if self.status == 'final'
      unless self.value == -1
        unless self.user.nil?
          game = self.scoreable
          game.increment!(:plays)
          game_stat = GameStat.where(:game_id => self.scoreable.id, :user_id => self.user.id).first
          if game_stat.present?
            new_score = game_stat.total + self.value
            play_count = game_stat.plays + 1
            new_avg = new_score/play_count.to_f
            game_stat.assign_attributes(:total=> new_score, :plays => play_count, :avg => new_avg)
          else
            game_stat = GameStat.new(:total=> self.value, :plays => 1, :avg => self.value, :user_id => self.user.id, :game_id => self.scoreable.id)
          end
          game_stat.save
        end
      end
    end
  end
end
