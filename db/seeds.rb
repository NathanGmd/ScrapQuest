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

TYPES = ["Gender", "Profession", "Study lvl", "Language", "Age", "Marital Status", "City", "Children"]
TYPE = {
  "Gender" => %w[Man Woman],
  "Profession" => ["Managers", "Professionals", "Employees", "Business Owners", "Unemployed", "Retired"],
  "Study lvl" => %w[None Licence Master Doctorate],
  "Language" => %w[French English German Spanish Mandarin],
  "Age" => (18..75).to_a,
  "Marital Status" => %w[Married Unmarried],
  "City" => %w[Bordeaux Paris Lyon Marseille Lille Strasbourg Perpignan],
  "Children" => %w[Yes No]
}

30_000.times do
  prospect = Prospect.create(
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address
  )
    prospect.email = "#{prospect.last_name}.#{prospect.first_name}@gmail.com"
end

Item.create(
  prospect: Prospect.last,
  feature: Feature.find_by(title: "Gender"),
  option: Option.find_by(value: "Woman")
)
puts "20%"

TYPES.each do |t|
  Feature.create(title: t)
end

TYPE.each do |t|
  test = t[1]
  test.each do |element|
    Option.create(value: element, feature: Feature.find_by(title: t[0]))
  end
end

puts "30%"

prospect_seed = Prospect.all.sample(26_000)
prospect_seed.each do |prospect|
  Item.create(
    prospect: prospect,
    feature: Feature.find_by(title: "Profession"),
    option: Option.where({ feature: Feature.find_by(title: "Profession") }).sample
  )
end

Prospect.all.each do |prospect|
  Item.create(
    prospect: prospect,
    feature: Feature.find_by(title: "Gender"),
    option: Option.where({ feature: Feature.find_by(title: "Gender") }).sample
  )
  if prospect.options.include?(Option.find_by(value: "Man"))
    prospect.first_name = Faker::Name.female_first_name
  else
    prospect.first_name = Faker::Name.male_first_name
  end
  prospect.email = "#{prospect.last_name}.#{prospect.first_name}@gmail.com"
  prospect.save
end
# Option.find_by({ feature_id: Feature.find_by(title: "Gender").id, prospect_id: prospect }) == Option.find_by(value: "Man")

puts "40%"

prospect_seed = Prospect.all.sample(26_000)
prospect_seed.each do |prospect|
  Item.create(
    prospect: prospect,
    feature: Feature.find_by(title: "Study lvl"),
    option: Option.where({ feature: Feature.find_by(title: "Study lvl") }).sample
  )
end

puts "50%"

prospect_seed = Prospect.all.sample(26_000)
prospect_seed.each do |prospect|
  Item.create(
    prospect: prospect,
    feature: Feature.find_by(title: "Language"),
    option: Option.where({ feature: Feature.find_by(title: "Language") }).sample
  )
end

puts "60%"

prospect_seed = Prospect.all
prospect_seed.each do |prospect|
  Item.create(
    prospect: prospect,
    feature: Feature.find_by(title: "Age"),
    value: (18..75).to_a.sample
  )
end

puts "70%"

prospect_seed = Prospect.all.sample(26_000)
prospect_seed.each do |prospect|
  Item.create(
    prospect: prospect,
    feature: Feature.find_by(title: "Marital Status"),
    option: Option.where({ feature: Feature.find_by(title: "Marital Status") }).sample
  )
end

puts "80%"

prospect_seed = Prospect.all.sample(26_000)
prospect_seed.each do |prospect|
  Item.create(
    prospect: prospect,
    feature: Feature.find_by(title: "City"),
    option: Option.where({ feature: Feature.find_by(title: "City") }).sample
  )
end

puts "26_000%"

prospect_seed = Prospect.all.sample(26_000)
prospect_seed.each do |prospect|
  Item.create(
    prospect: prospect,
    feature: Feature.find_by(title: "Children"),
    option: Option.where({ feature: Feature.find_by(title: "Children") }).sample
  )
end

puts "100%"
puts "done"
