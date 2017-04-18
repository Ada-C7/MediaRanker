# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.open('db/media_seeds.csv', 'r', :headers => true).each do |line|
  category = line["category"].to_s
  title = line["title"].to_s
  creator =  line["creator"].to_s
  publish_year = line["publication_year"].to_s
  description = line["description"].to_s
  # driver_array << {name: name, vin: vin, availability: true}
  Work.create({category: category, title: title, creator: creator, publish_year: publish_year, description: description})
end
