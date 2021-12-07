json.extract! minipost, :id, :content, :datetime, :created_at, :updated_at
json.url minipost_url(minipost, format: :json)
