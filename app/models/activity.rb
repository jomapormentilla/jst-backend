class Activity < ApplicationRecord
    belongs_to :week

    # validations
    validates :activity_type, 
        presence: true 
        # inclusion: { in: [] }
    validates :notes, 
        length: { maximum: 1000 }
    validates :status, 
        presence: true,
        inclusion: { in: ["To Do", "Pending", "Complete"] }
    # validates :action, 
    #     inclusion: { in: [] }

end