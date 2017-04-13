# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
# require 'faker'

# WORK
csv_text = File.read(Rails.root.join('lib', 'seeds', 'media_seeds.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  w = Work.new
  w.category = row['category']
  w.title = row['title']
  w.creator = row['creator']
  w.publication_year = row['publication_year'].to_i
  w.description = row['description']
  w.save
end

# USERS
# 25.times do
#   User.create(name: Faker::Name.first_name)
# end

User.create(name: "Anna")
User.create(name: "Cara")
User.create(name: "Elisabeth")
User.create(name: "Maria")
User.create(name: "Marisol")
User.create(name: "Tehut")
User.create(name: "Danielle")


# VOTES
100.times do
  Vote.create(user_id: Random.rand(7), work_id: Random.rand(26))
end
