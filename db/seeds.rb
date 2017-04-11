# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

# makes array of works parameter hashes
works = CSV.read("db/media_seeds.csv", {headers: true}).map do |line|
  { category: line[0],
    title: line[1],
    creator: line[2],
    pub_year: line[3],
    description: line[4]
  }
end

#creates new work objects from array
failed_work_count = 0
works.each do |work|
  current_work = Work.create(work)

  if !current_work.id
    failed_work_count += 1
    puts "#{current_work.title} failed to add"
  end
end
puts "#{failed_work_count} out of #{works.length} works not successfully added"
