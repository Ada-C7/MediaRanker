class Work < ApplicationRecord
  has_many :votes

  # validates :category, inclusion: { in: ["album", "movie", "book"] }
end
