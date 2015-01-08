class UserTopicsController < ApplicationController
  def index
  	# collection for my bookmarks
  	bookmarks = current_user.bookmarks
  	@my_topics = bookmarks.collect(&:topic).uniq
  	# collection for liked bookmarks
  	like_bookmarks = current_user.like_bookmarks
  	@liked_topics = like_bookmarks.collect(&:topic).uniq

  end
end
