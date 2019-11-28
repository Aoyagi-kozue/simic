json.extract! review, :id, :user_id, :comic_id, :review_text, :review_title, :netabare, :created_at, :updated_at
json.url review_url(review, format: :json)
