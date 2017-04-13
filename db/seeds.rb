# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Work.destroy_all
User.destroy_all
Vote.destroy_all

csv_text = File.read("db/media_seeds.csv")

csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')


random_users = []
10.times do
  user = User.create({:username => Faker::Name.first_name})
  random_users.push(user)
end

csv.each do |row|
  work = Work.new
  work.category = row["category"]
  work.title = row["title"]
  work.publication_year = row["publication_year"]
  work.description = row["description"]
  work.user_id = random_users.sample.id
  work.save!

  num_votes = rand(1..10)
  num_votes.times do
    vote = Vote.create({:user_id => random_users.sample.id, :work_id => work.id})
  end
end

10.times do
  movie = Work.new
  movie.category = "movie"
  movie.title = Faker::Pokemon.name
  movie.user_id = random_users.sample.id
  movie.publication_year = (10..20).to_a.sample.years.ago
  movie.description = Faker::Lorem.paragraph
  movie.save!

  num_votes = rand(1..10)
  num_votes.times do
    vote = Vote.create({:user_id => random_users.sample.id, :work_id => movie.id})
  end
end
# CSV.foreach('db/media_seeds.csv', :headers => true) do |medium|
#   Medium.create(category: medium[:category], title: medium[:title], creator: medium[:creator], publication_year: medium[:publication_year], description: medium[:description])
# end
