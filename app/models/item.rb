class Item < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

validates :title, presence: true
validates :category, presence: true, inclusion: { in: ['book', 'album', 'movie'],  message: "item must be album, book, or movie" }

def self.by_category(category)
  where(category: category).sort_by {|item| item.votes.count}.reverse
end

def self.top_ten_by_category(category)
  by_category(category)[0..9]
end


def self.spotlight
  Item.all.max_by { |item| item.votes.count}

  # Old method, when spoltlight was a randomly chosen work, rather than the   highest vote getter.
  # ids = Item.all.pluck(:id)
  # spotlight_id = ids.sample
  # find(spotlight_id)
end

end
