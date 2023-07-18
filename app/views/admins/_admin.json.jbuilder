json.extract! admin, :id, :email, :password, :name, :is_super, :created_at, :updated_at
json.url admin_url(admin, format: :json)
