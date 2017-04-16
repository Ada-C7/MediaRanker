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
puts "#{failed_work_count} out of #{works.length} works failed to add"

User.create ([
  {name: "Supa Dupa"},
  {name: "OUTRAGEOUS"},
  {name: "Totally Disengaged"},
  {name: "Lickety Split"},
  {name: "Unusual Suspect"}
  ])

Vote.create ([
  {user_id: 1, work_id: 4},
  {user_id: 1, work_id: 11},
  {user_id: 1, work_id: 13},
  {user_id: 2, work_id: 14},
  {user_id: 2, work_id: 18},
  {user_id: 2, work_id: 22},
  {user_id: 3, work_id: 25},
  {user_id: 3, work_id: 14},
  {user_id: 3, work_id: 26},
  {user_id: 4, work_id: 26},
  {user_id: 4, work_id: 29},
  {user_id: 4, work_id: 27},
  {user_id: 4, work_id: 28},
  {user_id: 5, work_id: 14},
  {user_id: 5, work_id: 27},
  {user_id: 5, work_id: 28},
])
