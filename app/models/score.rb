class Score < ActiveRecord::Base
  # attr_accessible :title, :description, :logo_url, :board_count, :rating, :times_played
  belongs_to :user
  belongs_to :scoreable, polymorphic: true
  # validates :value, :uniqueness => {:scope => [:user, :game, :game_num]}
  # acts_as_commentable

end
