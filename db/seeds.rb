# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

users = []

10.times do |index|
  if index.zero? # Add the specified user as the first user
    user = User.create!(
      email: "rahulpal80524yopgmail.com",
      password: 'password',
      password_confirmation: 'password'
    )
    users << user
  else
    user = User.create!(
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password'
    )
    users << user
  end
end

# Loop through each user and create 15 products for each
users.each do |user|
  15.times do
    Product.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      price: Faker::Commerce.price(range: 0..100.0, as_string: true),
      user_id: user.id
    )
  end
end
