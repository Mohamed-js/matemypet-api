json.extract! transaction, :id, :body, :user_id, :tier_id, :value, :service_transaction_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
