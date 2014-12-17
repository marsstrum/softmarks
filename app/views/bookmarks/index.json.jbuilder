json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :id, :url, :image, :topic_id, :user_id
  json.url bookmark_url(bookmark, format: :json)
end
