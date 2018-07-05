# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.
# Users
User.create!(name:  "Test",
             email: "jack@jack.com",
             username: "tester",
  				job_title: "Chief Tester",
  				department: "Test_department", 
             password:              "foobar",
             password_confirmation: "foobar"
             )

9.times do |n|
  name  = Faker::Name.name
  username = "user-#{n+1}"
  job_title = "Role-#{n+1}"
  department = "Department-#{n+1}"
  email = "example-#{n+1}@email.org"
  password = "password"
  User.create!(name:  name,
  				username: username,
  				job_title: job_title,
  				department: department, 
               email: email,
               password:              password,
               password_confirmation: password
               )
end

# Streams
users = User.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.streams.create!(text: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }