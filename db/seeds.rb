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

csv_file = File.read(Rails.root.join('lib', 'assets', 'media_seeds.csv'))
csv_data = CSV.parse(csv_file, :headers => true)
csv_data.each do |row|
  work = Work.new
  work.media_type = row[0]
  work.title = row[1]
  work.by = row[2]
  work.year = row[3].to_i
  work.description = row[4]
  work.save
end
