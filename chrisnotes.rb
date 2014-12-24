topic = Topic.find_or_create(key: value)
#or 
topic = Topic.find_or_create_by_name(params[:topic][:name])
topic = Topic.find_or_create_by_name_and_url(name, url)

topic =  Topic.find_or_create_by_name(some_sting_with_your_topic_name)
user_topic = UserTopic.create(topic: topic, user: current_user)

bookmark = Bookmark.find_or_create_by_url(some_string_with_your_bookmark_url)
topic.bookmarks << bookmark unless topic.include? bookmark
user_bookmark = UserBookmark.create(bookmark: bookmark, user: current_users)

# incomiong controller 
user = User.find_by_email(params[:sender])