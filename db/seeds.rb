# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

# users = %w(zoralie martin bob erik chamelea fishface mrmonkeyhead uglifier awesomeprint george)
#
# users.each do |user|
#   newu = User.create!({username: "#{user}"})
#   if !newu.id
#     puts "couldn't create user #{user.username}"
#   end
#
# end

works_array = []
CSV.read("db/media_seeds.csv", headers: true).map do |line|
  work = { category: line[0], title: line[1], creator: line[2], published: line[3], description: line[4] }
  works_array << work
end

works_array.each do |work|
  neww = Work.create!(work)
  if !neww.id
    puts "couldn't create work #{work.title}"
  end
end
