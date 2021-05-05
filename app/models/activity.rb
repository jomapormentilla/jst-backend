class Activity < ApplicationRecord
    belongs_to :week

    # validations
    validates :activity_type, 
        presence: true 
        # inclusion: { in: []}
    


end

# t.string "company"
# t.string "contact"
# t.string "job_title"
# t.string "job_link"
# t.string "contact_method"
# t.string "action"
# t.boolean "action_complete"
# t.string "notes"
# t.string "status"
# t.date "date"
# t.bigint "week_id", null: false
# t.index ["week_id"], name: "index_activities_on_week_id"