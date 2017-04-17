class Work < ApplicationRecord
  CATEGORIES =  %w(album movie book)
  has_many :votes, dependent: :destroy
  validates :title, presence: true

  validates :category, presence: true , inclusion: { in: CATEGORIES }

end
