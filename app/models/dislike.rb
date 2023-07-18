class Dislike < ApplicationRecord
    belongs_to :disliker_animal, class_name: "Animal", foreign_key: "disliker_animal_id"
    belongs_to :disliked_animal, class_name: "Animal", foreign_key: "disliked_animal_id"
end
