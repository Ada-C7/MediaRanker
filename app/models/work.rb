class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true

  #title must be unique within each category
  validates :title, uniqueness: { scope: :category, message: "has already been taken"}
end
