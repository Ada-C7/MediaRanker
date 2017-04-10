# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

seeds_location = Rails.root.join('db', 'media_seeds.csv')
CSV.read(
  seeds_location,
  headers: true,
  header_converters: :symbol,
  converters: :all
).each {|line| Work.create(line.to_h)}
