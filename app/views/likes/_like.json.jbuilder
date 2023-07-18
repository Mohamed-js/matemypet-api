json.extract! like, :id, :liker_animal_id, :liker_user_id, :liked_animal_id, :liked_user_id, :is_liked_back, :created_at, :updated_at
json.url like_url(like, format: :json)
