# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# City.destroy_all
# User.destroy_all
# Gossip.destroy_all
# Comment.destroy_all

10.times do |index|
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip)
end

50.times do |index|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Movies::StarWars.wookiee_sentence, email: "email#{index}@example.com", age: rand(18..77), city: City.all.sample)
end

10.times do |index|
  Gossip.create(title: Faker::Coffee.blend_name, content: "#{Faker::Coffee.notes} #{Faker::Quotes::Shakespeare.hamlet_quote}", user: User.all.sample)
end

20.times do
  Comment.create(content: Faker::Movies::StarWars.wookiee_sentence, user: User.all.sample, gossip: Gossip.all.sample)
end