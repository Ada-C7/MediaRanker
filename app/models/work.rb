class Work < ApplicationRecord
  validates :title, presence: true
  validates :category, inclusion: { in: ["book", "movie", "album"] }
end
