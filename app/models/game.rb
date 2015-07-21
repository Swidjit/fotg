class Game < ActiveRecord::Base
  # attr_accessible :title, :description, :logo_url, :board_count, :rating, :times_played
  has_many :scores, as: :scoreable, :dependent => :delete_all
  has_many :streaks, :dependent => :delete_all
  has_many :game_stats

  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_commentable

end
