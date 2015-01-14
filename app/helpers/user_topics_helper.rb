module UserTopicsHelper
	def bookmarks_for_topic(bookmarks, topic)
		bookmarks.select {|bookmark| bookmark.topic == topic}
	end
end
