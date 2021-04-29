require 'faker'
require 'date'

# creates 1 global test account
User.find_or_create_by!(email: "admin@test.com") do |user|
    user.password = "admin"
end if Rails.env.development?

# creates 10 student/graduates
10.times do
    User.create({
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        password: "password", 
        account_type: "Student/graduate", 
        status: "Job seeking", 
        job_search_start_date: Faker::Date.backward(days: 14).strftime("%a, %d %b %Y")
    })
end

# creates 3 admins
3.times do
    User.create({
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        password: "password", 
        account_type: "Admin"
    })
end

# creates 20 activities
20.times do
    Activity.create({

    })
end

# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.string "activity_type"
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