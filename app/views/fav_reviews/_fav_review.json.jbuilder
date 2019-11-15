json.extract! fav_review, :id, :user_id, :review_id, :created_at, :updated_at
json.url fav_review_url(fav_review, format: :json)
