class Work < ApplicationRecord
  # has_many :votes
  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true }

end
