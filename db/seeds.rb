# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
puts "progress :"

Item.destroy_all
Filter.destroy_all
Option.destroy_all
Prospect.destroy_all
Feature.destroy_all
Research.destroy_all

TYPES = %w[gender profession study_lvl language age marital_status city children]
TYPE = {
  "gender" => %w[male female],
  "profession" => %w[baker builder manager commercial taillor],
  "study_lvl" => %w[none licence master doctorat],
  "language" => %w[french english german spanish],
  "age" => (20..70).to_a.sample(7).sort,
  "marital_status" => %w[yes no],
  "city" => %w[bordeaux paris london barcelona berlin],
  "children" => %w[yes no]
}

1500.times do
  newprospect = Prospect.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address
  )
  newprospect.email = "#{newprospect.last_name}.#{newprospect.first_name}@gmail.com"
  newprospect.save
end
puts "20%"

TYPES.each do |t|
  Feature.create(title: t)
end

puts "40%"

TYPE.each do |t|
  test = t[1]
  test.each do |element|
    Option.create(value: element, feature: Feature.find_by(title: t[0]))
  end
end

puts "70%"

Prospect.all.each do |prospect|
  Item.create(
    prospect: prospect,
    feature: Feature.find_by(title: "gender"),
    option: Option.where({ feature: Feature.find_by(title: "gender") }).sample
  )
end

6000.times do
  item = Item.new(
    prospect: Prospect.all.sample,
    feature: Feature.all.sample
  )
  item.option = item.feature.options.sample
  item.save
end

puts "done"
