json.extract! ad_view, :id, :is_liked, :longitude, :latitude, :country, :city, :ad_id, :user_id, :created_at, :updated_at
json.url ad_view_url(ad_view, format: :json)
