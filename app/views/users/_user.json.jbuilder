json.extract! user, :id, :name, :votes, :created_at, :updated_at
json.url user_url(user, format: :json)
