# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# column names in the CSV file
# category,title,creator,publication_year,description

CSV.foreach(Rails.root.join('lib', 'assets', 'media_seeds.csv'), headers: true) do |row|
  work = Work.new
  work.title = row[:title]
  work.by = row[:creator]
  work.year = row[:publication_year].to_i
  work.description = row[:description]
  work.media_type = row[:category]
  work.save
end
