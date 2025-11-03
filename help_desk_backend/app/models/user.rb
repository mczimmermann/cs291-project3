class User < ApplicationRecord
    has_secure_password
    
    # username should be not null and unique
    validates :username, presence: true, uniqueness: true

    # password should be not null
    validates :password, presence: true
end
