json.extract! comic, :id, :author_id, :publisher_id, :labels_id, :genre_id, :title, :created_at, :updated_at
json.url comic_url(comic, format: :json)
