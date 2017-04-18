
require 'csv'

works_file = File.read( Rails.root.join( 'db', 'media_seeds.csv') )

csv_works = CSV.parse(works_file, :headers => true)
csv_works.each do |row|
  work = Work.new
  work.category = row['category']
  work.title = row['title']
  work.creator = row['creator']
  work.publication_year = row['publication_year']
  work.description = row['description']
  work.save
end

#schema
# create_table "works", force: :cascade do |t|
#   t.string   "category"
#   t.string   "title"
#   t.string   "creator"
#   t.integer  "publication_year"
#   t.string   "description"
#   t.datetime "created_at",       null: false
#   t.datetime "updated_at",       null: false
# end

# # example of csv
# category,title,creator,publication_year,description
# album,Can't Buy a Thrill,Steely Dan,1972,
