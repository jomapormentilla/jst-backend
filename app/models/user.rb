class User < ApplicationRecord
    has_many :weeks

    has_secure_password

    # validations
    validates :name, :email, presence: true
    validates :account_type, inclusion: { in: ["Student/graduate", "Career Coach", "Admin"]}
    
end
