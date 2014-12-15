json.array!(@user_topics) do |user_topic|
  json.extract! user_topic, :id, :user_id, :topic_id
  json.url user_topic_url(user_topic, format: :json)
end
