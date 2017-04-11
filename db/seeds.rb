# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

work_array = []
CSV.open('db/media_seeds.csv', 'r', :headers => true).each do |line|
  category = line["category"]
  title = line["title"]
  creator = line["creator"]
  pub_yr = line["publication_year"].to_i
  description = line["description"]

  work_array << {category: category, title: title, creator: creator, pub_yr: pub_yr, desc: description}
end

Work.create(work_array)
