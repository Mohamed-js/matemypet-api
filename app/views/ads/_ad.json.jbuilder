json.extract! ad, :id, :owner, :priority, :link_to_ad, :views, :app_appearance_place, :image, :caption, :duration_in_days, :is_expired, :created_at, :updated_at
json.url ad_url(ad, format: :json)
