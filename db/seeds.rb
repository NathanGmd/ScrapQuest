# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "progress :"

Prospect.destroy_all
Feature.destroy_all
Option.destroy_all
Item.destroy_all
Filter.destroy_all
Research.destroy_all

TYPES = %w[gender profession study_lvl nationality language age marital_status city children]
TYPE = {
  "gender" => %w[male female],
  "profession" => %w[baker builder manager commercial taillor],
  "study_lvl" => %w[none licence master doctorat],
  "nationality" => %w[french english spanish german belgian],
  "language" => %w[french english german spanish],
  "age" => (20..70).to_a,
  "marital_status" => [true, false],
  "city" => %w[bordeaux paris london barcelona berlin],
  "children" => [true, false]
}

Prospect.create(first_name: "John", last_name: "Doe", address: "158 avenue de la victoire", email: "john.doe@gmail.com")
Prospect.create(first_name: "Jane", last_name: "Dupont", address: "35 cours Victor", email: "jane.dupont@gmail.com")
Prospect.create(first_name: "Camille", last_name: "Ella", address: "132 cours alsace loraine", email: "camille.elladoe@gmail.com")
Prospect.create(first_name: "Ellias", last_name: "akir", address: "26 rue des petits poies", email: "ellias.akir@gmail.com")
Prospect.create(first_name: "Justine", last_name: "maunier", address: "145 rue des routes", email: "Justine.maunier@gmail.com")

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

30.times do
  item = Item.new(
    prospect: Prospect.all.sample,
    feature: Feature.all.sample
  )
  item.option = item.feature.options.sample
  item.save
end

puts "done"
