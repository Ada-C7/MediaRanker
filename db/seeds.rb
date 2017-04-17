# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

works = []
temp_csv =  CSV.read(Rails.root.join('db/media_seeds.csv'))
temp_csv.shift
temp_csv.each do |work|
  work_hash = Hash.new
  work_hash[:category] = work[0]
  work_hash[:title] = work[1]
  work_hash[:creator] = work[2]
  work_hash[:description] = work[4]
  work_hash[:publication_year] = work[4].to_i

  works << work_hash
end

success_count = 0
works.each do |t|
  work = Work.create(t)

  if work.id
    success_count += 1
    puts "work #{work.id} successfully added"
  end
end
