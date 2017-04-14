class Work < ApplicationRecord
  validates :category, inclusion: { in: %w(book movie album) }
  validates :title, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :publish_year, presence: true
end
