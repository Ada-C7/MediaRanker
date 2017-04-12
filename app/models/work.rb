class Work < ApplicationRecord
  validates :category, presence: true, inclusion: { in: %w(book movie album) }
  validates :title, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :publish_year, presence: true
end
