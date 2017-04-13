class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true,
  inclusion: { in: %w(movie book album), message: "%{value} is not a valid category" }

  validates :name, presence: true

  validates :created_by, presence: true

  validates :pub_year, presence: true,
  numericality: { only_integer: true },
  length: { is: 4 }
end
