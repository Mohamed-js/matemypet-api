json.extract! user_report, :id, :user_id, :reported_id, :reported_type, :body, :image, :read, :created_at, :updated_at
json.url user_report_url(user_report, format: :json)
