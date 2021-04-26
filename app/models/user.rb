class User < ApplicationRecord
    has_many :weeks

    has_secure_password
end
