class Content < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :publication_year, presence: true
  validates_inclusion_of :category, :in => %w( book movie album)
end
