# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.read("support/media_seeds.csv", {:headers => true}).each do |work|
  args = {
          :category => work[0],
          :title => work[1],
          :creator => work[2],
          :publication_year => work[3],
          :description => work[4]

        }
  Work.create(args)
end


CSV.read("support/users_seeds.csv", {:headers => true}).each do |user|
  args = {
          :name => user[1],
        }
  User.create(args)
end

CSV.read("support/votes_seeds.csv", {:headers => true}).each do |vote|
  args = {
          :user_id => vote[1],
          :work_id => vote[2],
        }
  Vote.create(args)
end
