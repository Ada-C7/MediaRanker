# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

# category,title,creator,publication_year,description

CSV.read("#{ Rails.root }/db/media_seeds.csv", {:headers => true}).each do |work|
  args = {
          :category => work[0],
          :title => work[1],
          :created_by => work[2],
          :year_published => work[3],
          :description => work[4],
        }
  Work.create(args)
end
