class Item < ApplicationRecord

validates :category, presence: true, inclusion: { in: ['book', 'album', 'movie'],  message: "item must be album, book, or movie" }

def self.by_category(category)
  where(category: category)
end

def self.spotlight
  r = rand(1..Item.all.count)
  find(r)
end


end
