json.extract! user, :id, :name, :email, :profile, :blog_url, :created_at, :updated_at
json.url user_url(user, format: :json)
