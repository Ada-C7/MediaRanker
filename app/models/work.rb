class Work < ApplicationRecord
    has_many :votes
    has_many :users, through: :votes

    validates :title, presence: true
    validates :published_year, numericality: { only_integer: true, allow_nil: true }
    validates :category, presence: true, inclusion: { in: %w(book movie album) }
end
