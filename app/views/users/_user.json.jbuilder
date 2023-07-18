json.extract! user, :id, :first_name, :last_name, :gender, :email, :email_verified_at, :password, :token, :otp_code, :avatar, :verified, :blocked, :bio, :longitude, :latitude, :country, :city, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
