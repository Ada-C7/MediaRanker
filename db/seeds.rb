require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'media_seeds.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  work = Work.new
  work.category = row['category']
  work.title = row['title']
  work.creator = row['creator']
  work.publication_year = row['publication_year']
  work.description = row['description']
  work.save
  puts "#{work.category}, #{work.title}, #{work.creator}, #{work.publication_year}, #{work.description} saved!"
end

puts "There are now #{Work.count} rows in the passengers table"
