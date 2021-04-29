require 'faker'
require 'date'

# creates 1 main student test account
User.find_or_create_by!(email: "student@test.com") do |user|
    user.name = 'student'
    user.password = "test"
    user.account_type = "Student/graduate"
end

# creates 1 main admin test account
User.find_or_create_by!(email: "admin@test.com") do |user|
    user.name = 'admin'
    user.password = "test"
    user.account_type = "Admin"
end

# creates 10 random student/graduates
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

# creates 3 random admins
3.times do
    User.create({
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        password: "password", 
        account_type: "Admin"
    })
end

# creates 5 email activities
5.times do
    Activity.create({
        activity_type: "???", 
        company: Faker::Company.name, 
        job_title: Faker::Job.title, 
        job_link: Faker::Internet.url, 
        contact_method: "email", 
        action: "???", 
        action_complete: true, 
        notes: Faker::Company.catch_phrase, 
        status: "???", 
        date: Faker::Date.backward(days: 5).strftime("%a, %d %b %Y")
    })
end

5.times do
    Activity.create({
        activity_type: "???", 
        company: Faker::Company.name, 
        job_title: Faker::Job.title, 
        job_link: Faker::Internet.url, 
        contact_method: "LinkedIn", 
        action: "???", 
        action_complete: true, 
        notes: Faker::Company.catch_phrase, 
        status: "???", 
        date: Faker::Date.backward(days: 5).strftime("%a, %d %b %Y")
    })
end

# user: User.find(User.pluck(:id).sample)