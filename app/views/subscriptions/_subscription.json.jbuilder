json.extract! subscription, :id, :user_id, :tier_id, :has_unlimited_likes, :likes, :max_file_size, :pets, :ads, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
