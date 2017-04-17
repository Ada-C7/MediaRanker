# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

content_info = File.read(Rails.root.join('db', 'media_seeds.csv'))
content_info = CSV.parse(content_info, :headers => true)

content_info.each do |row|
  c = Content.new
  c.category = row['category']
  c.title = row['title']
  c.creator = row['creator']
  c.publication_year = row['publication_year']
  c.description = row['description']
  c.save
end

puts "There are #{Content.all.length} media pieces saved out of #{content_info.length}"
