class LikeBookmarksController < ApplicationController
	def create
		@bookmark = Bookmark.find(params[:bookmark_id])
		like_bookmark = current_user.like_bookmarks.build(bookmark: @bookmark)

		if like_bookmark.save
			flash[:notice] = "Bookmark was liked"
			redirect_to :back
		else
			flash[:error] = "There was an error liking the bookmark.  Please try again."
			render 'topics/show'
		end
	end

	def destroy
		@bookmark = Bookmark.find(params[:bookmark_id])
		like_bookmark = @bookmark.like_bookmarks.find(params[:id])

		if like_bookmark.destroy
			flash[:notice] = "This bookmark was unliked."
			redirect_to :back
		else
			flash[:error] = "Could not unlike bookmark.  Try again."
			redirect_to :back
		end
	end

end
