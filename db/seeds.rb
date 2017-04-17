# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
work_file = Rails.root.join('db', 'media_seeds.csv')

CSV.foreach(work_file, headers: true, header_converters: :symbol, converters: :all) do |row|
  info = Hash[row.headers.zip(row.fields)]
  puts info
  Work.create!(info)
end
