class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :like_bookmarks
  #has_many :user_topics
  has_many :users, through: :like_bookmarks

  default_scope { order('updated_at DESC')}
end
