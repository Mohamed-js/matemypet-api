class Animal < ApplicationRecord
    reverse_geocoded_by :latitude, :longitude
    belongs_to :user
    belongs_to :breed
    has_one :type, through: :breed
    has_many :avatars
    has_many :likes, foreign_key: "liked_animal_id", counter_cache: true         # Likes made to him
    has_many :dislikes, foreign_key: "disliker_animal_id"   # Dislikes he made

    def likes_count
        likes.count
    end

    def recommendations(params)
        animals_to_exclude_ids = dislikes.pluck(:disliked_animal_id) +
                                    Like.where(liker_animal_id: id).pluck(:liked_animal_id) +
                                    Like.where(liked_animal_id: id, is_liked_back: true).pluck(:liker_animal_id) +
                                    user.animals.pluck(:id)
        
        min_dob = DateTime.now - params[:max_age].to_i.years
        max_dob = DateTime.now - params[:min_age].to_i.years

        recs = params[:same_breed] ? breed.animals : type.animals
        recs =  recs.where.not(gender: gender)
                    .where("dob >= ?", min_dob)
                    .where("dob <= ?", max_dob)
                    .where.not(id: animals_to_exclude_ids)

        recs = recs.where(vaccinated: true) unless params[:no_vaccination_needed]
        recs = recs.near([latitude, longitude], params[:distance], units: :km) if params[:distance].to_i != 0
        recs.limit(10)
    end
end