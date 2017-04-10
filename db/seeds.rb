# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('db', 'media_seeds.csv' ))
csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    t = Item.new
    t.category = row[0]
    t.title = row[1]
    t.creator = row[2]
    t.publication_year = row[3]
    t.description = row[4]
    t.save
  end
