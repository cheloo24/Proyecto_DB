json.array!(@followers) do |follower|
  json.extract! follower, :id, :user_id, :seguido_id
  json.url follower_url(follower, format: :json)
end
