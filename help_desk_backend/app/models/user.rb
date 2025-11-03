class User < ApplicationRecord
    has_secure_password

    # username should be not null and unique
    validates :username, presence: true, uniqueness: true

    # password should be not null, and should be long-ish? API specification lists "Password is too short" error message
    validates :password, presence: true, length: { minimum: 6 }
end
