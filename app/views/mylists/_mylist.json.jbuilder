json.extract! mylist, :id, :user_id, :comic_id, :author_id, :created_at, :updated_at
json.url mylist_url(mylist, format: :json)
