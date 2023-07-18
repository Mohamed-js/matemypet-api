json.extract! animal, :id, :user_id, :breed_id, :name, :gender, :bio, :dob, :vaccinated, :longitude, :latitude, :created_at, :updated_at
json.url animal_url(animal, format: :json)
