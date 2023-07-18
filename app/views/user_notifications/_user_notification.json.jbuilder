json.extract! user_notification, :id, :user_id, :body, :image, :title, :redirect_to, :redirect_to_id, :created_at, :updated_at
json.url user_notification_url(user_notification, format: :json)
