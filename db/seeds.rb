# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.open('media_seeds.csv', 'r', :headers => true).each do |line|
  title = line["title"]
  vin = line["vin"]
  creator
  publication_year
  description

  # driver_array << {name: name, vin: vin, availability: true}
  Work.create({title: name, vin: vin, availability: true})
end
