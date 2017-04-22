# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

items_file = Rails.root.join('db', 'media_seeds.csv')

CSV.foreach(items_file, headers: true) do |row|
  Item.create(category: row['category'], title: row['title'], creator: row['creator'], publication_year: row['publication_year'], description: row['description'])
end
