require 'csv'

works_csv = File.read(Rails.root.join('lib', 'seeds', 'media_seeds.csv'))
csv = CSV.parse(works_csv, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  w = Work.new
  w.category = row['category']
  w.title = row['title']
  w.creator = row['creator']
  w.pub_date = row['publication_year']
  w.description = row['description']
  w.save
  puts "#{w.title}, #{w.creator}, #{w.pub_date} saved"
end

puts "There are now #{Work.count} rows in the works table"
