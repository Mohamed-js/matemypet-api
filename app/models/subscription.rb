class Subscription < ApplicationRecord
    belongs_to :tier
    belongs_to :user
end
