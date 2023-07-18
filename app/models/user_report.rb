class UserReport < ApplicationRecord
    belongs_to :user
    
    def reported
        if reported_type == 'animal'
            Animal.find reported_id
        else
            User.find reported_id
        end
    end
end
