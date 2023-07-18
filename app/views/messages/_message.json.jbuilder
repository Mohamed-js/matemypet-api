json.extract! message, :id, :chat_id, :sender_id, :receiver_id, :body, :seen, :is_multimedia, :is_video, :tumbnail, :created_at, :updated_at
json.url message_url(message, format: :json)
