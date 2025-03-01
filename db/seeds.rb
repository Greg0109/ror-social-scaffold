# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
10.times do
  User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: "qwerty", password_confirmation: "qwerty")
end

User.create(name: 'Greg', email: 'greg.rabago@gmail.com', password: '123456', password_confirmation: '123456')
User.create(name: 'Test', email: 'test.rabago@gmail.com', password: '123456', password_confirmation: '123456')