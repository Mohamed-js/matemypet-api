class Type < ApplicationRecord
    has_many :breeds
    has_many :animals, -> { order(id: :asc) }, through: :breeds
end
