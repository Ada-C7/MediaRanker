class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  validates :title, presence: true, uniqueness: { scope: :category,
    message: "Cannot have two work with the same title in the same category" }
  validates :publication_year, numericality: { greater_than: 0, less_than_or_equal_to: Time.now.year}
  validates :category, presence: true, inclusion: %w(album book movie)
end
#validates scope:
