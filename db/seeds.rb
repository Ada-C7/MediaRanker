require 'csv'

works_csv_text = File.read( Rails.root.join('lib', 'seeds', 'media_seeds.csv') )

csv_works = CSV.parse(works_csv_text, :headers => true)
csv_works.each do |row|
  work = Work.new
  work.category = row['category']
  work.title = row['title']
  work.creator = row['creator']
  work.publication_year = row['publication_year']
  work.description = row['description']
  work.save
end

#GENERATE SOME USERS
User.create(name: "Elizabeth")
User.create(name: "Anna")
User.create(name: "Emily")
User.create(name: "Annika")
User.create(name: "Kingsley")
User.create(name: "Marie")
User.create(name: "Bill")
User.create(name: "Dara")

#GENERATE SOME VOTES
100.times do
  Vote.create(user_id: Random.rand(8), work_id: Random.rand(26))
end
