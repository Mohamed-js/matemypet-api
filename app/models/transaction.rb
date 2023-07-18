class Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :tier
    serialize :body
end
