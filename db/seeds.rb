# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

work_csv_text = File.read(Rails.root.join('db', 'media_seeds.csv'))
work_csv = CSV.parse(work_csv_text, headers: true)
work_csv.each do |row|
    t = Work.new
    t.category = row['category']
    t.title = row['title']
    t.creator = row['creator']
    t.publication_year = row['publication_year']
    t.description = row['description']
    t.save
end
