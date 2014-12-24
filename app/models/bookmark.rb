class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :like_bookmarks
  has_many :users, through: :like_bookmarks
end
