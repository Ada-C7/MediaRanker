# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach("db/media_seeds.csv", :headers => true) do |line|
  w = Work.new
  w.category = line[1].to_s
  w.title = line[2].to_s
  w.creator = line[3].to_s
  w.pub_year = line[4].to_i
  w.description = line[5]
  w.save

  puts "#{w.name} saved"
end
