# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# category,title,creator,publication_year,description

require 'csv'

csv_file = File.read(Rails.root.join('lib', 'seeds', 'media_seeds.csv'))

csv = CSV.parse(csv_file, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  work = Work.new
  work.category = row["category"]
  work.title = row["title"]
  work.creator = row["creator"]
  work.publication_year = row["publication_year"]
  work.description = row["description"]

  work.save!
end
