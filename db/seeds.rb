# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
10.times do
  name = Faker::Restaurant.name
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.phone_number
  category = %w(chinese italian japanese french belgian).sample.capitalize
  restaurant = Restaurant.create(name: name, address: address, phone_number: phone_number, category: category)
  3.times do
    rating = rand(0..5).to_i
    content = Faker::Restaurant.review
    Review.create(rating: rating, content: content, restaurant: restaurant)
  end
  puts "Creating: #{restaurant.name}"
end
