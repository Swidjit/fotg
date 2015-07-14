class TypingNews < ActiveRecord::Base


  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_commentable

end
