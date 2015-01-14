class UserTopicsController < ApplicationController

  def index
  	# collection for my bookmarks
  	@bookmarks = current_user.bookmarks 
  	#@bookmarks = Bookmark.where(user_id: current_user.id)
  	@my_topics = @bookmarks.collect(&:topic).uniq #this does not work?
  	# collection for liked bookmarks
  	@like_bookmarks = current_user.like_bookmarks.collect(&:bookmark) #like_bookmarks = LikeBookmark.where(user_id: current_user)?
		@liked_topics = @like_bookmarks.collect(&:topic).uniq

  end
end
