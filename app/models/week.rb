class Week < ApplicationRecord
    belongs_to :user
    has_many :activities

    #validations
    validates :commits, 
        numericality: { only_integer: true }
    # validation for blog links??
    
end
