class User < ApplicationRecord
    has_many :weeks

    has_secure_password

    # validations
    validates :name, :email, presence: true


end
