class User < ApplicationRecord
    has_many :weeks

    has_secure_password

    # validations
    validates :name, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true, on: :create
    validates :account_type, inclusion: { in: ["Student/graduate", "Career Coach", "Admin"]}

end
