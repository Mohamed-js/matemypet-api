class Like < ApplicationRecord
    belongs_to :liker_user, class_name: "User", foreign_key: "liker_user_id"
    belongs_to :liked_user, class_name: "User", foreign_key: "liked_user_id"
    belongs_to :liker_animal, class_name: "Animal", foreign_key: "liker_animal_id"
    belongs_to :liked_animal, class_name: "Animal", foreign_key: "liked_animal_id"
end
