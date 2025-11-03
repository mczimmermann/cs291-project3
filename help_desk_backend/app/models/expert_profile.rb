class ExpertProfile < ApplicationRecord

    # user_id should be not null and unique
    validates :user_id, presence: true, uniqueness: true

end
