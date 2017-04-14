class Work < ApplicationRecord
  has_many :users
  has_many :votes
  validates :title, presence: true
  validates :publication_year, numericality: { only_integer: true }
end
