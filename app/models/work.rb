class Work < ApplicationRecord
  has_many :votes

  validates :creator, presence: true
  validates :category, presence: true
  validates :title, presence: true
  validates :published, numericality: { only_integer: true, greater_than: 0, less_than: 10000 }
end
