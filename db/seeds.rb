require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'media_seeds.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  w = Work.new
  w.category = row['category']
  w.title = row['title']
  w.creator = row['creator']
  w.publication_year = row['publication_year']
  w.description = row['description']
  w.save
  puts "#{w.category} #{w.title} saved"
end
