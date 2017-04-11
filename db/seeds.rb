# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach("db/media_seeds.csv", :headers => true) do |line|

  p = Work.new
  p.mediatype = line[1].to_s
  p.title = line[2].to_s
  p.creator = line[3].to_s
  p.year = line[4].to_i
  p.description = line[5].to_s
  p.save

  puts "#{p.title} saved"
end
