class Breed < ApplicationRecord
    has_many :animals, -> { order(id: :asc) }
    belongs_to :type
end
