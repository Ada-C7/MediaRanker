require 'csv'

media_file = Rails.root.join('lib', 'seeds', 'media_seeds.csv')

CSV.foreach(media_file, headers: true) do |row|
  Work.create!(
    category: row['category'],
    title: row['title'],
    creator: row['creator'],
    publication_year: row['publication_year'],
    description: row['description']
  )
end
