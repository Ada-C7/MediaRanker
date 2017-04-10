class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true
  validates :category, format: {with: /[a-zA-Z]+/}

  validates :title, presence: true
  validates :title, format: {with: /[a-zA-Z]+/}

  validates :creator, presence: true
  validates :creator, format: {with: /[a-zA-Z]+/}

  validates :publication_year, presence: true
  validates :publication_year, numericality: {:greater_than_or_equal_to => 0}

  # validates :description, presence: true

end
