json.extract! read, :id, :user_id, :comic_id, :created_at, :updated_at
json.url read_url(read, format: :json)
