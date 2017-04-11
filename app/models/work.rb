class Work < ApplicationRecord
  validates :category, presence: true
  validates :name, presence: true
  validates :created_by, presence: true
  validates :pub_year, presence: true, numericality: { only_integer: true }, length: { is: 4 }
  validates :desc, presence: true
end
