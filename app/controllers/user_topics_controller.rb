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

  def destroy
  	@user_bookmark = current_user.bookmarks.find(params[:id])
  	if @user_bookmark.destroy
  		flash[:notice] = "Removed bookmark."
  		redirect_to :back
  	else
  		flash[:error] = "Unable to remove bookmark.  Please try again."
  		redirect_to :back
  	end
  end
end
