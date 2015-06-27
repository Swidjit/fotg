class OtherGame < ActiveRecord::Base
  # attr_accessible :title, :description, :logo_url, :board_count, :rating, :times_played

  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_commentable

end
